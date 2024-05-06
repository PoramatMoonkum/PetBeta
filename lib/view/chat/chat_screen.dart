// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:pettakecare/api/apis.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(CupertinoIcons.home),
//         title: const Text('Pet Take Care'),
//         actions: [
//           IconButton(onPressed: (){}, icon: const Icon(Icons.search)),

//           IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
//         ],
//       ),

//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 10),
//         child: FloatingActionButton(onPressed: () async{
//           await APIs.auth.signOut();
//           await GoogleSignIn().signOut();
//         },
//         child: const 
//         ),
//       ),
//     );
//   }
// }