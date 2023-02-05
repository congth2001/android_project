import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_picker_initial/network/user_request.dart';

class FriendWidget extends StatefulWidget {
  var friendObj = {};
  FriendWidget({required this.friendObj});

  @override
  State<FriendWidget> createState() => _FriendWidgetState();
}

class _FriendWidgetState extends State<FriendWidget> {
  var friend;
  var user;
  @override
  void initState() {
    super.initState();
    setState(() {
      friend = widget.friendObj;
      print(friend);
      UserRequest.getUserByID(friend['id'].toString()).then((data) {
        setState(() {
          user = data;
          print(user);
        });
      });
    });
    // print(widget.friendObj['id'].toString());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar.toString()),
                    radius: 30.0,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(user.username.toString(),
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 15.0),
                Spacer(),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuilderContext) {
                            return SizedBox(
                                height: 300,
                                child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          hoverColor: Colors.white,
                                          onTap: () {},
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.person,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Text("See Andrew's friends",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        InkWell(
                                          hoverColor: Colors.white,
                                          onTap: () {},
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                  FontAwesomeIcons
                                                      .facebookMessenger,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Message Andrew',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        InkWell(
                                          hoverColor: Colors.white,
                                          onTap: () {},
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.person,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("See Andrew's profile",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        InkWell(
                                          hoverColor: Colors.white,
                                          onTap: () {},
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.block,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Block Andrew',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        InkWell(
                                          hoverColor: Colors.white,
                                          onTap: () {},
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.cancel,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Unfriend Andrew',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10)
                                      ],
                                    )));
                          });
                    },
                    icon: Icon(Icons.more_horiz, color: Colors.black))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
