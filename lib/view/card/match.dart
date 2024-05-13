import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pettakecare/common/consts.dart';

class BookingCard extends StatelessWidget {
  final String bookId;
  final Function(bool)? onAcceptChanged;

  const BookingCard({
    required this.bookId,
    this.onAcceptChanged,
  });

  @override
  Widget build(BuildContext context) {
    final books = FirebaseFirestore.instance.collection('books');
    return Card(
      elevation: 1,
      clipBehavior: Clip.none,
      child: StreamBuilder(
        stream: books.doc(bookId).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          if (!(snapshot.data!.exists)) {
            return Container();
          }
          final book = snapshot.data;

          return Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.blueGrey,
                      child: Image.asset(
                        'assets/img/pr.jpg',
                        fit: BoxFit.cover,
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ชื่อลูกค้า: '),
                    Text('ฝากเลี้ยงน้อง: ' + book?.get('pet_name')),
                    Text('จำนวนวัน: ' + (book?.get('day')).toString()),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                          'ยอดรวม ${(PAY_PERDAY * (book?.get('day') ?? -1))} บาท'),
                    )
                  ],
                ),
                Image.asset(
                  'assets/img/pr.jpg',
                  width: 100,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (onAcceptChanged != null) {
                      onAcceptChanged!(false);
                    }
                  },
                  child: Text('ปฏิเสธ'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (onAcceptChanged != null) {
                      onAcceptChanged!(true);
                    }
                  },
                  child: Text('ตกลง'),
                ),
              ],
            ),
          ]);
        },
      ),
    );
  }
}
