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
  bool isVisible1 = true;
  bool isVisible2 = true;
  bool isVisible3 = true;
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
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0,
          leading: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[100], // background
              foregroundColor: Colors.black,
              elevation: 0,
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
            onPressed: () => {Navigator.pop(context)},
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 15),
            color: Colors.grey[100],
            child: Column(
              children: [
                // SizedBox(
                //     height: height / 4,
                //     width: width,
                //     child: Image(
                //       image: AssetImage("assets/login_another_account.jpg"),
                //       fit: BoxFit.cover,
                //     )),
                Text('Change password',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Your password must be at least 6 characters and should include a combination of numbers and letters',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: currentPasswordController,
                      style: TextStyle(fontSize: FontSize.contentSize),
                      obscureText: isVisible1,
                      decoration: InputDecoration(
                        hintText: 'Current password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            isVisible1
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              isVisible1 = !isVisible1;
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
                      obscureText: isVisible2,
                      decoration: InputDecoration(
                        hintText: 'New password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            isVisible2
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              isVisible2 = !isVisible2;
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
                    obscureText: isVisible3,
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          isVisible3 ? Icons.visibility : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            isVisible3 = !isVisible3;
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
                                              insetPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 32),
                                              title: Text(successTitle,
                                                  style: TextStyle(
                                                      fontSize:
                                                          FontSize.titleSize,
                                                      color: Color.fromARGB(
                                                          255, 10, 192, 37),
                                                      fontWeight:
                                                          FontWeight.bold)),
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
                                                          fontSize: FontSize
                                                              .contentSize,
                                                          color: Colors.black)),
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, 'Cancel');
                                                  },
                                                )
                                              ]));
                                } else {
                                  String errorTitle =
                                      'Incorrect current Password';
                                  String errorDetail =
                                      'The current password you entered is incorrect. Please try again.';
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                              insetPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 32),
                                              title: Text(errorTitle,
                                                  style: TextStyle(
                                                      fontSize:
                                                          FontSize.titleSize,
                                                      color: Color.fromARGB(
                                                          255, 234, 19, 19),
                                                      fontWeight:
                                                          FontWeight.bold)),
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
                                                          fontSize: FontSize
                                                              .contentSize,
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
                            }
                          },
                          child: Text(
                            'Change password',
                            style: TextStyle(fontSize: FontSize.contentSize),
                          ))),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ));
  }
}
