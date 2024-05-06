import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pettakecare/main.dart';

class CardUser extends StatefulWidget {
  const CardUser({super.key});

  @override
  State<CardUser> createState() => _CardUserState();
}

class _CardUserState extends State<CardUser> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: .04, vertical: 4 ),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: (){},
        child: const ListTile(
          //User profile piture
          leading: CircleAvatar(child: Icon(CupertinoIcons.person)),
          
          //User name
          title: Text('Ai'),

          //last messge
          subtitle: Text('Last user message', maxLines: 1),
          
          //last messge time
          trailing: Text(
            '12:00 PM',
            style: TextStyle(color: Colors.black54),

            
          ),
        ),
      ),);
  }
}