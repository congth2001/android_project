// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:math';

import 'package:photo_picker_initial/network/auth_request.dart';
import 'package:photo_picker_initial/pages/create_account/account_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/font_size.dart';
import 'package:http/http.dart' as http;

class CreateAccountSendEmail extends StatefulWidget {
  const CreateAccountSendEmail({Key? key}) : super(key: key);

  @override
  State<CreateAccountSendEmail> createState() => _CreateAccountSendEmailState();
}

class _CreateAccountSendEmailState extends State<CreateAccountSendEmail> {
  final emailInputController = TextEditingController();
  bool isValid = true;
  bool isSent = false;
  String otp = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    final phoneNumber = prefs.getString('phoneNumber').toString();
    // get otp
    AuthRequest.getVerifyCode(phoneNumber).then((code) => {
          setState(() {
            otp = code;
          })
        });
  }

  // send email auto
  Future sendEmail() async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_2lmyj2t";
    const templateId = "template_dq38juy";
    const userId = "Drb3pccQ2j2USAV-t";
    // send code to mail
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userId,
          "template_params": {
            "email": emailInputController.text,
            "message": otp
          }
        }));
    return response.statusCode;
  }

  @override
  void dispose() {
    emailInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            backgroundColor: Colors.white,
            title: Text('Account confirmation',
                style: TextStyle(
                    color: Colors.black, fontSize: FontSize.titleSize))),
        body: SingleChildScrollView(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                height: (height - 40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(children: [
                        SizedBox(height: 40),
                        Center(
                            child: Text('Enter your email',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.titleSize,
                                    fontWeight: FontWeight.bold))),
                        SizedBox(height: 10),
                        TextField(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  isValid = true;
                                });
                              } else {
                                setState(() {
                                  isValid = false;
                                });
                              }
                            },
                            controller: emailInputController,
                            style: TextStyle(fontSize: FontSize.contentSize),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear,
                                    color: Colors.grey, size: 16),
                                onPressed: () {
                                  emailInputController.clear();
                                },
                              ),
                              labelText: 'Email',
                            )),
                        SizedBox(height: 10),
                        !isValid
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Enter Your Email',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.red)))
                            : Text(''),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 30,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (emailInputController.text.isEmpty) {
                                    setState(() {
                                      isValid = false;
                                    });
                                  } else {
                                    sendEmail();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AccountConfirmationPage()),
                                        (route) => false);
                                  }
                                },
                                child: Text(
                                  'Next',
                                  style:
                                      TextStyle(fontSize: FontSize.contentSize),
                                )))
                      ])
                    ]))));
  }
}
