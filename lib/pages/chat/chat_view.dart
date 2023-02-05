import 'package:photo_picker_initial/models/user.dart';
import 'package:photo_picker_initial/pages/chat/chat_detail_view.dart';
import 'package:photo_picker_initial/shared/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'chat_new_view.dart';
import 'chat_settings.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<User> users = List<User>.empty();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  children: [
                    Container(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatSettings()));
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/andrew.jpg"))),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text('Chat',
                        style: TextStyle(
                            fontSize: FontSize.titleSize,
                            fontWeight: FontWeight.bold)),
                    Spacer(),
                    Container(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {},
                        hoverColor: Colors.white,
                        child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.camera_alt,
                              size: 18,
                            )),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatNewView()));
                        },
                        hoverColor: Colors.white,
                        child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.edit,
                              size: 18,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(users.length, (index) {
                      var user = users.elementAt(index);
                      return Container(
                        width: 60,
                        child: Column(
                          children: [
                            Stack(alignment: Alignment.bottomRight, children: [
                              Container(
                                height: 45,
                                width: 45,
                                margin: const EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            user.avatar.toString()))),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                    )),
                              ),
                            ]),
                            SizedBox(height: 3),
                            Text(user.username.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12))
                          ],
                        ),
                      );
                    }),
                  )),
              SizedBox(height: 15),
              ...List.generate(users.length, (index) {
                var user = users.elementAt(index);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatDetailView()));
                    },
                    child: Row(
                      children: [
                        Stack(alignment: Alignment.bottomRight, children: [
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
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                )),
                          ),
                        ]),
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
                              'Hello. My name is Lan. 12:43pm',
                              style: TextStyle(fontSize: 11),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ));
  }
}
