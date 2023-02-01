import 'package:flutter/material.dart';
import '../shared/font_size.dart';
import 'home_page.dart';
import 'find_account_page.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:photo_picker_initial/network/auth_request.dart';
import 'dart:convert';
import 'package:photo_picker_initial/models/user.dart';

import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final passwordController = TextEditingController();
  bool noVisible = true;
  bool showText = false;

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  var phoneNumber = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  var user = User();

  getData() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    phoneNumber = prefs.getString('phoneNumber').toString();
    String userID = prefs.getString('userID').toString();
    AuthRequest.getUserByID(userID).then((result) {
      print(result.username);
      print(userID);
      setState(() {
        user = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: Container(
          margin: EdgeInsets.only(top: 160),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar.toString()),
                  radius: 35,
                ),
              ),
              SizedBox(height: 15),
              Text(
                user.username.toString(),
                style: TextStyle(fontSize: FontSize.titleSize),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: noVisible ? 7 : 11,
                      child: TextField(
                        style: TextStyle(fontSize: FontSize.contentSize),
                        controller: passwordController,
                        obscureText: noVisible,
                        onChanged: (text) {
                          if (text.isNotEmpty) {
                            setState(() {
                              showText = true;
                            });
                          } else {
                            setState(() {
                              showText = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Password",
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 92, 91, 91))),
                        ),
                      ),
                    ),
                    if (showText)
                      Expanded(
                        flex: 2,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              textStyle: TextStyle()),
                          child: Text(
                            noVisible ? 'SHOW' : 'HIDE',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: FontSize.contentSize,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {
                              noVisible = !noVisible;
                            });
                          },
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 30,
                child: ElevatedButton(
                    onPressed: () {
                      var password = passwordController.text + "";
                      AuthRequest.login(phoneNumber, password)
                          .then((result) async {
                        print(result.statusCode);
                        // Direct to next page
                        if (result.statusCode == 200) {
                          final user = jsonDecode(result.body);
                          // Obtain shared preferences.
                          final prefs = await SharedPreferences.getInstance();
                          // Save an String value to 'username' key.
                          await prefs.setString('userID', user['data']['id']);

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        } else {
                          print(result.statusCode);
                          String errorTitle = 'Incorrect Password';
                          String errorDetail =
                              'The password you entered is incorrect. Please try again.';
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                      insetPadding:
                                          EdgeInsets.symmetric(horizontal: 32),
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
                                                  fontSize:
                                                      FontSize.contentSize,
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
                      'LOG IN',
                      style: TextStyle(fontSize: FontSize.contentSize),
                    )),
              ),
              SizedBox(height: 30),
              TextButton(
                child: Text('Forgot password?',
                    style: TextStyle(fontSize: FontSize.contentSize)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FindAccountPage()));
                },
              ),
              SizedBox(height: 90),
            ],
          ),
        ),
      ),
    ));
  }
}
