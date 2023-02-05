// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:photo_picker_initial/pages/create_account/account_confirmation.dart';
import 'package:photo_picker_initial/pages/create_account/create_account_send_email.dart';
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
      Future(() {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CreateAccountSendEmail()),
            (route) => false);
      });
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
