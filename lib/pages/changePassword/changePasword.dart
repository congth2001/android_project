// ignore_for_file: prefer_const_constructors

import 'package:photo_picker_initial/network/user_request.dart';
import 'package:photo_picker_initial/pages/create_account/create_new_account.dart';
import 'package:photo_picker_initial/shared/font_size.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';
import 'package:photo_picker_initial/network/auth_request.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class changePassword extends StatefulWidget {
  const changePassword({Key? key}) : super(key: key);

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  bool isVisible = true;
  bool isValid = true;
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String token = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    // Gọi đến storage
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token').toString();
    });
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
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
                  controller: currentPasswordController,
                  style: TextStyle(fontSize: FontSize.contentSize),
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    hintText: 'Current password',
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
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: newPasswordController,
                  style: TextStyle(fontSize: FontSize.contentSize),
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    hintText: 'New password',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: confirmPasswordController,
                onChanged: (text) {
                  var newPassword = newPasswordController.text + "";
                  if (text.isEmpty || text != newPassword) {
                    setState(() {
                      isValid = false;
                    });
                  } else {
                    setState(() {
                      isValid = true;
                    });
                  }
                },
                style: TextStyle(fontSize: FontSize.contentSize),
                obscureText: isVisible,
                decoration: InputDecoration(
                  hintText: 'Confirm password',
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
              ),
            ),
            !isValid
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Enter Valid Code',
                        style: TextStyle(fontSize: 12, color: Colors.red)))
                : Text(''),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {
                        var currentPassword =
                            currentPasswordController.text + "";
                        var confirmPassword =
                            confirmPasswordController.text + "";
                        var newPassword = newPasswordController.text + "";
                        // var password = currentPasswordController.text + "";
                        if (confirmPassword == newPassword) {
                          AuthRequest.changePassword(
                                  token, currentPassword, newPassword)
                              .then((res) async {
                            // Gọi API thành côn
                            // Direct to next page
                            if (res['code'] == '1000') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                              String successTitle = 'Success';
                              String successDetail =
                                  'You have successfully changed your password';
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                          insetPadding: EdgeInsets.symmetric(
                                              horizontal: 32),
                                          title: Text(successTitle,
                                              style: TextStyle(
                                                  fontSize: FontSize.titleSize,
                                                  color: Color.fromARGB(
                                                      255, 10, 192, 37),
                                                  fontWeight: FontWeight.bold)),
                                          content: Text(successDetail,
                                              style: TextStyle(
                                                  fontSize:
                                                      FontSize.contentSize,
                                                  color: Color.fromARGB(
                                                      255, 74, 243, 99))),
                                          actions: [
                                            TextButton(
                                              child: Text('OK',
                                                  style: TextStyle(
                                                      fontSize:
                                                          FontSize.contentSize,
                                                      color: Colors.black)),
                                              onPressed: () {
                                                Navigator.pop(
                                                    context, 'Cancel');
                                              },
                                            )
                                          ]));
                            } else {
                              String errorTitle = 'Incorrect current Password';
                              String errorDetail =
                                  'The current password you entered is incorrect. Please try again.';
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                          insetPadding: EdgeInsets.symmetric(
                                              horizontal: 32),
                                          title: Text(errorTitle,
                                              style: TextStyle(
                                                  fontSize: FontSize.titleSize,
                                                  color: Color.fromARGB(
                                                      255, 234, 19, 19),
                                                  fontWeight: FontWeight.bold)),
                                          content: Text(errorDetail,
                                              style: TextStyle(
                                                  fontSize:
                                                      FontSize.contentSize,
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
                                                Navigator.pop(
                                                    context, 'Cancel');
                                              },
                                            )
                                          ]));
                            }
                          }).catchError((e) {
                            print("Got error: $e");
                          });
                        } else {
                          String errorTitle = 'Incorrect confirm Password';
                          String errorDetail =
                              'The confirm password you entered is incorrect. Please try again.';
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                      insetPadding:
                                          EdgeInsets.symmetric(horizontal: 32),
                                      title: Text(errorTitle,
                                          style: TextStyle(
                                              fontSize: FontSize.titleSize,
                                              color: Color.fromARGB(
                                                  255, 234, 19, 19),
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
                      },
                      child: Text(
                        'Change password',
                        style: TextStyle(fontSize: FontSize.contentSize),
                      ))),
            ),
            SizedBox(height: 15),
            // TextButton(
            //   child: Text(
            //     'Forgot password?',
            //     style: TextStyle(fontSize: FontSize.contentSize),
            //   ),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => FindAccountPage()),
            //     );
            //   },
            // ),
            // SizedBox(height: 30),
            // Text("---------------------- OR ----------------------"),
            // SizedBox(height: 30),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: SizedBox(
            //       width: 300,
            //       height: 30,
            //       child: ElevatedButton(
            //           onPressed: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => CreateNewAccount()));
            //           },
            //           style: ElevatedButton.styleFrom(
            //               backgroundColor: Colors.green),
            //           child: Text(
            //             'Create New Facebook Account',
            //             style: TextStyle(fontSize: FontSize.contentSize),
            //           ))),
            // ),
          ],
        ),
      ),
    ));
  }
}
