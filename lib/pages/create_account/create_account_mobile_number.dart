// ignore_for_file: prefer_const_constructors

import 'package:photo_picker_initial/pages/create_account/create_account_password.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/font_size.dart';
import '../landing_page.dart';

class MobileNumberPage extends StatefulWidget {
  const MobileNumberPage({Key? key}) : super(key: key);

  @override
  State<MobileNumberPage> createState() => _MobileNumberPageState();
}

class _MobileNumberPageState extends State<MobileNumberPage> {
  final mobileNumberController = TextEditingController();

  bool isValid = true;

  @override
  void dispose() {
    mobileNumberController.dispose();
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
            title: Text('Mobile number',
                style: TextStyle(
                    color: Colors.black, fontSize: FontSize.titleSize))),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 80),
                Text("Enter your mobile number",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.titleSize)),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    isValid
                        ? 'Enter the mobile number where you can be reached. You can hide this from your profile later.'
                        : 'Please enter a valid mobile number.',
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
                    controller: mobileNumberController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: FontSize.contentSize),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear, color: Colors.grey, size: 16),
                          onPressed: () {
                            mobileNumberController.clear();
                          },
                        ),
                        labelText: 'Mobile number',
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
                        onPressed: () async {
                          if (mobileNumberController.text == '' || mobileNumberController.text.length != 10) {
                            setState(() {
                              isValid = false;
                            });
                          } else {
                            // Obtain shared preferences.
                            final prefs = await SharedPreferences.getInstance();
                            // get username
                            var phoneNumber = mobileNumberController.text;
                            // Save an String value to 'username' key.
                            await prefs.setString('phoneNumber', phoneNumber);
                            // Direct other page
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PasswordPage()));
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
