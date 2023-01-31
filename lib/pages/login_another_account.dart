// ignore_for_file: prefer_const_constructors

import 'package:fakebook/pages/create_account/create_new_account.dart';
import 'package:fakebook/shared/font_size.dart';
import 'package:flutter/material.dart';

import 'find_account_page.dart';
import 'home_page.dart';
import 'package:fakebook/network/user_request.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginAnotherAccount extends StatefulWidget {
  const LoginAnotherAccount({Key? key}) : super(key: key);

  @override
  State<LoginAnotherAccount> createState() => _LoginAnotherAccountState();
}

class _LoginAnotherAccountState extends State<LoginAnotherAccount> {
  bool isVisible = true;
  final passwordController = TextEditingController();
  final phonenumberController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    phonenumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
                height: height / 4,
                width: width,
                child: Image(
                  image: AssetImage("assets/login_another_account.jpg"),
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              'Tiếng việt * English * More.....',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: phonenumberController,
                style: TextStyle(fontSize: FontSize.contentSize),
                decoration: InputDecoration(
                  hintText: 'Phone or email',
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: passwordController,
                  style: TextStyle(fontSize: FontSize.contentSize),
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                    ),
                  ),
                )),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {
                        var phoneNumber = phonenumberController.text + "";
                        var password = passwordController.text + "";
                        UserRequest.login(phoneNumber, password).then((result) async {
                          print(result);
                          // Direct to next page
                          if (result.statusCode == 200) {
                            final user = jsonDecode(result.body);
                            // Obtain shared preferences.
                            final prefs = await SharedPreferences.getInstance();
                            // Save an String value to 'username' key.
                            await prefs.setString('userID', user['data']['id']);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          }else{
                            print(result.statusCode);
                            String errorTitle = 'Incorrect Password';
                            String errorDetail =
                                'The password you entered is incorrect. Please try again.';
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                    insetPadding: EdgeInsets.symmetric(horizontal: 32),
                                    title: Text(errorTitle,
                                        style: TextStyle(
                                            fontSize: FontSize.titleSize,
                                            fontWeight: FontWeight.bold)),
                                    content: Text(errorDetail,
                                        style: TextStyle(
                                            fontSize: FontSize.contentSize,
                                            color: Color.fromARGB(
                                                255, 88, 88, 88))),
                                    actions: [
                                      TextButton(
                                        child: Text('OK',
                                            style: TextStyle(
                                                fontSize: FontSize.contentSize,
                                                color: Colors.black)),
                                        onPressed: () {
                                          Navigator.pop(context, 'Cancel');
                                        },
                                      )
                                    ]));
                          }
                        });
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(fontSize: FontSize.contentSize),
                      ))),
            ),
            SizedBox(height: 15),
            TextButton(
              child: Text(
                'Forgot password?',
                style: TextStyle(fontSize: FontSize.contentSize),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FindAccountPage()),
                );
              },
            ),
            SizedBox(height: 30),
            Text("---------------------- OR ----------------------"),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                  width: 300,
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateNewAccount()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: Text(
                        'Create New Facebook Account',
                        style: TextStyle(fontSize: FontSize.contentSize),
                      ))),
            ),
          ],
        ),
      ),
    ));
  }
}
