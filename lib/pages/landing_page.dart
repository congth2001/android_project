// ignore_for_file: prefer_const_constructors

import 'package:photo_picker_initial/network/post_request.dart';
import 'package:photo_picker_initial/pages/create_account/create_new_account.dart';
import 'package:photo_picker_initial/pages/find_account_page.dart';
import 'package:photo_picker_initial/pages/login_another_account.dart';
import 'package:photo_picker_initial/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/font_size.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String username = "";
  bool showAccount = true;
  String avatar = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      // Obtain shared preferences.
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print('token in langing page: $token');
      // Set showAccount
      if (token == null) {
        setState(() {
          showAccount = false;
        });
      } else {
        // update username
        setState(() {
          username = prefs.getString('username').toString();
          avatar = prefs.getString('avatar').toString();
          print(avatar);
        });
      }
    } catch (e) {
      print('Exception in landing page: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            constraints: BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.facebook_rounded, size: 70, color: Colors.blue),
                SizedBox(height: 30),
                if (showAccount)
                  SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              textStyle: TextStyle()),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(avatar),
                                      radius: 25,
                                    )),
                                Text(username,
                                    style: TextStyle(
                                        fontSize: FontSize.titleSize,
                                        color: Colors.black))
                              ]),
                              PopupMenuButton(
                                icon: Icon(Icons.more_vert,
                                    color: Colors.black, size: 20),
                                position: PopupMenuPosition.under,
                                onSelected: (value) {
                                  if (value == 0) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                                title: Text(
                                                    'Remove account from device',
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize.titleSize,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                content: Text(
                                                    "You'll need to enter your phone number or email and password to log in again.",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 88, 88, 88),
                                                        fontSize: FontSize
                                                            .contentSize)),
                                                actions: [
                                                  TextButton(
                                                    child: Text('CANCEL',
                                                        style: TextStyle(
                                                            fontSize: FontSize
                                                                .contentSize,
                                                            color:
                                                                Colors.black)),
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context, 'Cancel');
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text(
                                                        'REMOVE ACCOUNT',
                                                        style: TextStyle(
                                                            fontSize: FontSize
                                                                .contentSize,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    10,
                                                                    90,
                                                                    156))),
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context, 'Remove');
                                                    },
                                                  ),
                                                ]));
                                  }
                                },
                                itemBuilder: (BuildContext bc) {
                                  return const [
                                    PopupMenuItem(
                                      value: 0,
                                      height: 30,
                                      textStyle: TextStyle(
                                          fontSize: FontSize.contentSize),
                                      child: Text("Remove account from device"),
                                    ),
                                    PopupMenuItem(
                                      value: 1,
                                      height: 30,
                                      textStyle: TextStyle(
                                          fontSize: FontSize.contentSize),
                                      child: Text("Mute push notifications"),
                                    ),
                                  ];
                                },
                              )
                            ],
                          ))),
                SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: TextButton(
                        style: TextButton.styleFrom(textStyle: TextStyle()),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginAnotherAccount()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(Icons.add, color: Colors.blue),
                            ),
                            Text('Log Into Another Account',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSize.contentSize)),
                          ],
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 150),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: TextButton(
                        style: TextButton.styleFrom(textStyle: TextStyle()),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FindAccountPage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(Icons.search, color: Colors.blue),
                            ),
                            Text('Find Your Account',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSize.contentSize)),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 202, 222, 241),
                          textStyle: TextStyle()),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateNewAccount()),
                        );
                      },
                      child: Text('CREATE NEW FACEBOOK ACCOUNT',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize.contentSize))),
                )
              ],
            )));
  }
}
