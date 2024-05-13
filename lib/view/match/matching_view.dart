import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pettakecare/common/consts.dart';
import 'package:pettakecare/view/pay_view/payment_view.dart';

class MatchingView extends StatefulWidget {
  // const MatchingView({super.key, required this.selectedTags});
  const MatchingView({super.key, required this.bookId});
  final String bookId;

  @override
  State<MatchingView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MatchingView> {
  final books = FirebaseFirestore.instance.collection('books');
  final sitters = FirebaseFirestore.instance.collection('sitters');
  final notifications = FirebaseFirestore.instance.collection('notifications');

  final maxRetry = MAX_RETRY_MATCH;
  int ticker = RETRY_TICKER;
  int retry = 0;
  Timer? timer;
  List<String> tryIds = [];

  @override
  void initState() {
    super.initState();
    tryIds = [];
    _matchSitter(widget.bookId);
    timer = Timer.periodic(Duration(seconds: ticker), (Timer t) {
      log('retry: $retry');
      if (retry >= maxRetry) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'ขออภัยขณะนี้ไม่มีที่รับฝากตรงกับความต้องการของท่าน กรุณาทำรายการใหม่อีกครั้ง'),
        ));
        _cacelBook(widget.bookId);
        return;
      }
      _matchSitter(widget.bookId);
      retry += 1;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
    Navigator.pop(context);
  }

  Future<void> _matchSitter(bookId) async {
    var snapshot = await books.doc(bookId).get();
    if (!snapshot.exists) {
      return;
    }
    // log('get book!');
    var book = snapshot.data();

    if (book?['status'] == 'matched') {
      timer?.cancel();
    }

    // log('book: ${book.toString()}');
    var options = book!['options'];
    Query query = sitters;
    options.forEach((key, value) {
      if (value == true) {
        query = query.where(key, isEqualTo: true);
      }
    });

    // if onsite seleted that filter sitters who setting onsite enabled
    if (book['onsite'] == true) {
      query = query.where('onsite', isEqualTo: true);
    }

    log('tryIds: $tryIds');

    for (var element in tryIds) {
      query = query.where(FieldPath.documentId, isNotEqualTo: element);
    }

    QuerySnapshot snapshot2 = await query.get();
    if (!snapshot.exists) {
      return;
    }

    log('Got: snapshot2');

    if (snapshot2.docs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'ขออภัยขณะนี้ไม่มีที่รับฝากตรงกับความต้องการของท่าน กรุณาทำรายการใหม่อีกครั้ง'),
      ));
      _cacelBook(bookId);
      return;
    }

    log('Found: ${snapshot2.docs.length}');
    for (var element in snapshot2.docs) {
      log('element: ${element.id}');
      if (tryIds.contains(element['user_id'])) {
        continue;
      }

      await books.doc(bookId).update({'sitter_id': element['user_id']});

      // send to sitters
      await notifications.add({
        'image': book['pet_image'],
        'extras': {'book_id': bookId},
        'title': 'งานใหม่',
        'message': 'กรุณายืนยันรายการภายใน 3 นาที',
        'type': 'booking',
        'read': false,
        'user_id': element['user_id'],
      });

      log('sent notification');
      if (!tryIds.contains(element['user_id'])) {
        tryIds.add(element['user_id']);
      }
      break;
    }
  }

  Future<void> _cacelBook(bookId) async {
    log('call _cacelBook');
    final docRef = books.doc(bookId);
    try {
      await docRef.update(
          {'status': 'canceled', 'timestamp': FieldValue.serverTimestamp()});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error adding data to Firestore')),
      );
      log(e.toString());
    } finally {
      timer?.cancel();
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  void _showBackDialog(bookId) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('ต้องการยกเลิก?'),
              content: const Text(
                'คุณต้องการยกเลิกการค้นหาใช่หรือไม่ ?',
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('ไม่'),
                ),
                TextButton(
                  onPressed: () async {
                    await _cacelBook(bookId);
                  },
                  child: const Text('ใช่ ยกเลิก'),
                )
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final bookId = widget.bookId;

    const spinkit = SpinKitPouringHourGlass(
      color: Colors.orange,
      size: 150.0,
    );

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: StreamBuilder<DocumentSnapshot>(
              stream: books.doc(bookId).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!.get('status');
                  // log('Status: ${data}');
                  if (data != null && data == 'matched') {
                    timer?.cancel();
                    return const PaymentView();
                  }
                }
                return Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/img/app_logo.png",
                      width: media.width * 0.55,
                      height: media.width * 0.55,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 100),
                      child: Column(
                        children: [
                          spinkit,
                          const Text(
                            'กำลังค้นหาผู้รับเลี้ยง...',
                            style: TextStyle(fontSize: 36),
                          ),
                          PopScope(
                              canPop: false,
                              onPopInvoked: (bool didPop) {
                                if (didPop) {
                                  return;
                                }
                                _showBackDialog(bookId);
                              },
                              child: ElevatedButton(
                                onPressed: () => _showBackDialog(bookId),
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.red)),
                                child: const Text('ยกเลิก'),
                              )),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ));
  }
}
