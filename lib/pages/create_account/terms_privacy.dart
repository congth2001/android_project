// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:photo_picker_initial/network/auth_request.dart';
import 'package:photo_picker_initial/pages/create_account/creating_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/font_size.dart';
import '../landing_page.dart';

class TermsAndPrivacyPage extends StatefulWidget {
  const TermsAndPrivacyPage({Key? key}) : super(key: key);

  @override
  State<TermsAndPrivacyPage> createState() => _TermsAndPrivacyPageState();
}

class _TermsAndPrivacyPageState extends State<TermsAndPrivacyPage> {
  InAppWebViewController? webViewController;
  late var url;
  var initialUrl = 'https://www.facebook.com/policies_center';
  double progress = 0;
  var username = "";
  var phoneNumber = "";
  var password = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username').toString();
    phoneNumber = prefs.getString('phoneNumber').toString();
    password = prefs.getString('password').toString();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 20),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                            insetPadding: EdgeInsets.symmetric(horizontal: 16),
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
                                        color:
                                            Color.fromARGB(255, 10, 90, 156))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LandingPage()));
                                },
                              ),
                            ]));
              }),
          backgroundColor: Colors.white,
          title: Text('Terms & Privacy',
              style: TextStyle(
                  color: Colors.black, fontSize: FontSize.titleSize))),
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(initialUrl)),
            ),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        width: width - 32,
        height: 30,
        child: FloatingActionButton(
          onPressed: () {
            // Call API đăng ký tài khoản
            AuthRequest.signUp(phoneNumber, password).then((data) async {
              // Get local storage
              final prefs = await SharedPreferences.getInstance();
              // Save an String value to 'username' key.
              await prefs.setString('userID', data['id']);
              await prefs.setString('username', username);
              // Direct to next page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreatingAccountPage()));
            });
          },
          child: Text('Sign up', style: TextStyle(color: Colors.white)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
        ),
      ),
    );
  }
}
