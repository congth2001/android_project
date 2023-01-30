import 'package:fakebook/pages/chat/message_request_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../models/user.dart';
import '../../shared/font_size.dart';

class MessageRequests extends StatefulWidget {
  const MessageRequests({Key? key}) : super(key: key);

  @override
  State<MessageRequests> createState() => _MessageRequestsState();
}

class _MessageRequestsState extends State<MessageRequests> {
  List<User> users = List<User>.empty();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 40,
            leading: IconButton(
                icon:
                    const Icon(Icons.arrow_back, color: Colors.black, size: 20),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.white,
            title: Row(
              children: [
                const Text('Message requests',
                    style: TextStyle(
                        color: Colors.black, fontSize: FontSize.titleSize)),
                Spacer(),
                PopupMenuButton(
                  icon: Icon(Icons.more_vert, color: Colors.black, size: 20),
                  position: PopupMenuPosition.under,
                  onSelected: (value) {
                    if (value == 0) {}
                  },
                  itemBuilder: (BuildContext bc) {
                    return const [
                      PopupMenuItem(
                        value: 0,
                        height: 30,
                        textStyle: TextStyle(fontSize: FontSize.contentSize),
                        child: Text("Delete message requests"),
                      ),
                    ];
                  },
                )
              ],
            )),
        body: ListView(
            children: List.generate(users.length, (index) {
          var user = users.elementAt(index);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Container(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MessageRequestDetail()));
                },
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(user.avatar.toString()))),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.username.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: FontSize.contentSize)),
                        SizedBox(height: 5),
                        Text(
                          'New message. Jan 12',
                          style: TextStyle(fontSize: 11),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        })));
  }
}
