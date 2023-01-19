// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:fakebook/pages/create_account/account_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../shared/font_size.dart';
import '../landing_page.dart';

class SigningInPage extends StatefulWidget {
  const SigningInPage({Key? key}) : super(key: key);

  @override
  State<SigningInPage> createState() => _SigningInPageState();
}

class _SigningInPageState extends State<SigningInPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                  insetPadding: EdgeInsets.symmetric(horizontal: 16),
                  title: Text('Next Time, Log In With One Tap',
                      style: TextStyle(
                          fontSize: FontSize.titleSize,
                          fontWeight: FontWeight.bold)),
                  content: Text(
                      "You're now logged into Facebook. Save your password, and you can always log in on this phone by tapping your account.",
                      style: TextStyle(
                          fontSize: FontSize.contentSize,
                          color: Color.fromARGB(255, 88, 88, 88))),
                  actions: [
                    TextButton(
                      child: Text('NOT NOW',
                          style: TextStyle(
                              fontSize: FontSize.contentSize,
                              color: Colors.black)),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AccountConfirmationPage()),
                            (route) => false);
                      },
                    ),
                    TextButton(
                      child: Text('SAVE PASSWORD',
                          style: TextStyle(
                              fontSize: FontSize.contentSize,
                              color: Color.fromARGB(255, 10, 90, 156))),
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                    insetPadding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    title: Text(
                                        'Remember your phone number and password',
                                        style: TextStyle(
                                            fontSize: FontSize.titleSize,
                                            fontWeight: FontWeight.bold)),
                                    content: SizedBox(
                                      height: 150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                              "You'll need to enter this any time you log in on a new device.",
                                              style: TextStyle(
                                                  fontSize:
                                                      FontSize.contentSize,
                                                  color: Color.fromARGB(
                                                      255, 88, 88, 88))),
                                          SizedBox(height: 10),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("Phone",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Color.fromARGB(
                                                          255, 88, 88, 88)))),
                                          SizedBox(height: 3),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            width: double.infinity,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[300]),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text('097 508 59 69',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12)),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Password",
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Color.fromARGB(
                                                        255, 88, 88, 88))),
                                          ),
                                          SizedBox(height: 3),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            width: double.infinity,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[300]),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text('abc123@',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 30,
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor: Colors.blue,
                                                  textStyle: TextStyle()),
                                              onPressed: () {
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            AccountConfirmationPage()),
                                                    (route) => false);
                                              },
                                              child: Text('OK',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: FontSize
                                                          .contentSize))),
                                        ),
                                      )
                                    ]));
                      },
                    ),
                  ]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            backgroundColor: Colors.white,
            title: const Text('Signing in...',
                style: TextStyle(
                    color: Colors.black, fontSize: FontSize.titleSize))),
        body: Column(children: [
          SizedBox(height: 150),
          Center(
            child: LoadingAnimationWidget.discreteCircle(
                color: Colors.grey, size: 30),
          ),
          SizedBox(height: 10),
          Text('Signing in...',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: FontSize.titleSize))
        ]));
  }
}
