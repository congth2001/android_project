// ignore_for_file: prefer_const_constructors

import 'package:fakebook/pages/create_account/terms_privacy.dart';
import 'package:flutter/material.dart';
import '../../shared/font_size.dart';
import '../landing_page.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final passwordController = TextEditingController();

  bool isValid = true;

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

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
            title: Text('Password',
                style: TextStyle(
                    color: Colors.black, fontSize: FontSize.titleSize))),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 80),
                Text("Choose a password",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.titleSize)),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    isValid
                        ? "Create a password with at least 6 characters. It should be something others couldn't guess."
                        : 'Your password must have at least 6 letters, numbers and symbols (like ! and %).',
                    style: TextStyle(
                        color: isValid ? Colors.black : Colors.red,
                        fontSize: FontSize.contentSize),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: passwordController,
                    style: TextStyle(fontSize: FontSize.contentSize),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear, color: Colors.grey, size: 16),
                          onPressed: () {
                            passwordController.clear();
                          },
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: isValid ? Colors.blue : Colors.red),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: isValid ? Colors.blue : Colors.red)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: isValid ? Colors.blue : Colors.red))),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: ElevatedButton(
                        onPressed: () {
                          if (!RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
                              .hasMatch(passwordController.text) && !RegExp(
                                  r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
                              .hasMatch(passwordController.text)) {
                            setState(() {
                              isValid = false;
                            });
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>TermsAndPrivacyPage())
                            );
                          }
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: FontSize.contentSize),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
