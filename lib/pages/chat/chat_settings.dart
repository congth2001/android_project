import 'package:fakebook/pages/chat/message_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/font_size.dart';

class ChatSettings extends StatefulWidget {
  const ChatSettings({Key? key}) : super(key: key);

  @override
  State<ChatSettings> createState() => _ChatSettingsState();
}

class _ChatSettingsState extends State<ChatSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            leading: IconButton(
                icon:
                    const Icon(Icons.arrow_back, color: Colors.black, size: 20),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.white,
            title: const Text('Me',
                style: TextStyle(
                    color: Colors.black, fontSize: FontSize.titleSize))),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(top: 30, bottom: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/andrew.jpg"))),
              ),
              Text('Andrew',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
                      SizedBox(height: 50),
              Container(
                color: Colors.white,
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>MessageRequests())
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        color: Colors.white,
                        child:Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.blue, shape: BoxShape.circle),
                              child: Icon(Icons.sms, size: 18, color: Colors.white)),
                        ),
                        SizedBox(width: 10),
                        Text('Message requests')
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
