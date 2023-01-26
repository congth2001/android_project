// ignore_for_file: prefer_const_constructors

import 'package:fakebook/shared/font_size.dart';
import 'package:flutter/material.dart';

class ChatNewView extends StatefulWidget {
  const ChatNewView({Key? key}) : super(key: key);

  @override
  State<ChatNewView> createState() => _ChatNewViewState();
}

class _ChatNewViewState extends State<ChatNewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black, size: 20),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.white,
            title: Column(children: [
              Row(
                children: [
                  Text('New message',
                      style: TextStyle(
                          color: Colors.black, fontSize: FontSize.titleSize)),
                ],
              ),
              Row(
                children: [
                  Text('To: ',
                      style: TextStyle(
                        color: Colors.grey[300],
                      )),
                  Expanded(child: TextFormField())
                ],
              )
            ])),
        body: Container());
  }
}
