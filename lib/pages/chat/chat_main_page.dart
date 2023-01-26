// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fakebook/pages/chat/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatMainPage extends StatefulWidget {
  const ChatMainPage({Key? key}) : super(key: key);

  @override
  State<ChatMainPage> createState() => _ChatMainPageState();
}

class _ChatMainPageState extends State<ChatMainPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
          ChatView()
        ],),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey)
            )
          ),
          child: BottomNavigationBar(
            onTap: (value){
              setState(() {
                currentPage = value;
              });
            },
            currentIndex: currentPage,
            unselectedItemColor: Colors.grey[600],
            selectedItemColor: Colors.black,
            items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  label: 'Chats'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people_outline),
                  label: 'People'
                ),
                
            ]
          ),
        ),
      ),
    );
  }
}