// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../shared/font_size.dart';
import '../landing_page.dart';

class TermsAndPrivacyPage extends StatefulWidget {
  const TermsAndPrivacyPage({Key? key}) : super(key: key);

  @override
  State<TermsAndPrivacyPage> createState() => _TermsAndPrivacyPageState();
}

class _TermsAndPrivacyPageState extends State<TermsAndPrivacyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black, size: 20),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                              insetPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                              title: Text(
                                  'Do you want to stop creating your account?',
                                  style: TextStyle(
                                      fontSize: FontSize.titleSize,
                                      fontWeight: FontWeight.bold)),
                              content: Text(
                                  "If you stop now, you'll lose any progress you've made.",
                                  style: TextStyle(
                                      fontSize: FontSize.contentSize,
                                      color: Color.fromARGB(255, 88, 88, 88))),
                              actions: [
                                TextButton(
                                  child: Text('Continue creating account',
                                      style: TextStyle(
                                          fontSize: FontSize.contentSize,
                                          color: Colors.black)),
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                ),
                                TextButton(
                                  child: Text('Stop creating account',
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
            title: Text('Terms & Privacy',
                style: TextStyle(
                    color: Colors.black, fontSize: FontSize.titleSize))),
        body: Container());
  }
}
