// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:fakebook/pages/create_account/signing_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../shared/font_size.dart';
import '../landing_page.dart';

class CreatingAccountPage extends StatefulWidget {
  const CreatingAccountPage({Key? key}) : super(key: key);

  @override
  State<CreatingAccountPage> createState() => _CreatingAccountPageState();
}

class _CreatingAccountPageState extends State<CreatingAccountPage> with SingleTickerProviderStateMixin {
  bool isSuccess = false;
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1200));
    animation = Tween<double>(begin: 20, end: 40).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
    isSuccess = false;
    Timer(Duration(seconds: 3), () {
      setState(() {
        isSuccess = true;
      });
    });
    Timer(Duration(seconds: 5), (){
      Future((){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => SigningInPage()), (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            leading: IconButton(
                icon:
                    const Icon(Icons.arrow_back, color: Colors.black, size: 20),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                              insetPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              title: const Text(
                                  'Do you want to stop creating your account?',
                                  style: TextStyle(
                                      fontSize: FontSize.titleSize,
                                      fontWeight: FontWeight.bold)),
                              content: const Text(
                                  "If you stop now, you'll lose any progress you've made.",
                                  style: TextStyle(
                                      fontSize: FontSize.contentSize,
                                      color: Color.fromARGB(255, 88, 88, 88))),
                              actions: [
                                TextButton(
                                  child: const Text('Continue creating account',
                                      style: TextStyle(
                                          fontSize: FontSize.contentSize,
                                          color: Colors.black)),
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                ),
                                TextButton(
                                  child: const Text('Stop creating account',
                                      style: TextStyle(
                                          fontSize: FontSize.contentSize,
                                          color: Color.fromARGB(
                                              255, 10, 90, 156))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LandingPage()));
                                  },
                                ),
                              ]));
                }),
            backgroundColor: Colors.white,
            title: const Text('Creating account',
                style: TextStyle(
                    color: Colors.black, fontSize: FontSize.titleSize))),
        body: Column(children: [
          SizedBox(height: 150),
          !isSuccess
              ? Column(children: [
                  Center(
                    child: LoadingAnimationWidget.discreteCircle(
                        color: Colors.grey, size: 30),
                  ),
                  SizedBox(height: 10),
                  Text('Creating your account...',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: FontSize.titleSize))
                ])
              : Center(
                  child:
                      Icon(Icons.thumb_up, size: animation.value, color: Colors.blue))
        ]));
  }
}
