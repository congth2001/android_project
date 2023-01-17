// ignore_for_file: prefer_const_constructors

import 'package:fakebook/pages/create_account/create_account_name.dart';
import 'package:fakebook/pages/landing_page.dart';
import 'package:fakebook/shared/font_size.dart';
import 'package:flutter/material.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({Key? key}) : super(key: key);

  @override
  State<CreateNewAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateNewAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black, size: 20),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LandingPage()));
                }),
            backgroundColor: Colors.white,
            title: Text('Create account',
                style: TextStyle(color: Colors.black, fontSize: FontSize.titleSize))),
        body: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Center(
                child: SizedBox(
                    width: 400,
                    height: 180,
                    child:
                        Image(image: AssetImage("assets/create_account.jpg"))),
              ),
              Center(
                  child: Text('Join Facebook',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: FontSize.titleSize))),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                "We'll help you create a new account in a few easy steps.",
                textAlign: TextAlign.center, style: TextStyle(fontSize: FontSize.contentSize),),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 30,
                child: ElevatedButton(
                  child: Text('Next', style: TextStyle(fontSize: FontSize.contentSize),),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAccountName()));
                  },
                ),
              ),
              SizedBox(height: 100),
              Center(
                  child: TextButton(
                child: Text('Already have an account?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.contentSize,
                        color: Color.fromARGB(255, 5, 80, 141))),
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
                                      color: Color.fromARGB(255, 88, 88, 88),
                                      fontSize: FontSize.contentSize)),
                              actions: [
                                TextButton(
                                  child: Text('Continue creating account',
                                      style: TextStyle(
                                          fontSize: FontSize.contentSize, color: Colors.black)),
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
                                    Navigator.pop(context);
                                  },
                                ),
                              ]));
                },
              ))
            ])));
  }
}
