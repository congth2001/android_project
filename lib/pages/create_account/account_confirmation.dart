// ignore_for_file: prefer_const_constructors

import 'package:photo_picker_initial/network/auth_request.dart';
import 'package:photo_picker_initial/pages/create_account/creating_account.dart';
import 'package:photo_picker_initial/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:photo_picker_initial/pages/landing_page.dart';
import 'package:photo_picker_initial/pages/login_another_account.dart';
import 'package:photo_picker_initial/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/font_size.dart';

class AccountConfirmationPage extends StatefulWidget {
  const AccountConfirmationPage({Key? key}) : super(key: key);

  @override
  State<AccountConfirmationPage> createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isValid = true;
  String code = "";
  String phoneNumber = ""; // the phone number of user
  final codeController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      phoneNumber = prefs.getString('phoneNumber').toString();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            backgroundColor: Colors.white,
            title: const Text('Account confirmation',
                style: TextStyle(
                    color: Colors.black, fontSize: FontSize.titleSize))),
        // ignore: prefer_const_literals_to_create_immutables
        body: !isLoading ? Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            SizedBox(height: 50),
            Text('Enter the code',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: FontSize.titleSize,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: codeController,
              onChanged: (text) {
                if (text.isEmpty || text.length != 4) {
                  setState(() {
                    isValid = false;
                  });
                } else {
                  setState(() {
                    isValid = true;
                    code = text;
                  });
                }
              },
              style: TextStyle(fontSize: FontSize.contentSize),
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: InputDecoration(
                hintText: 'Confirmation code',
              ),
            ),
            !isValid
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Enter Valid Code',
                        style: TextStyle(fontSize: 12, color: Colors.red)))
                : Text(''),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                height: 30,
                child: ElevatedButton(
                  child: Text(
                    'Confirm',
                    style: TextStyle(fontSize: FontSize.contentSize),
                  ),
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    var code = codeController.text + "";
                    AuthRequest.checkVerifyCode(phoneNumber, code)
                        .then((data) async {
                      // Thành công
                      if (data['code'] == '1000') {
                        // Direct to next page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginAnotherAccount()));
                      } else {
                        var code = codeController.text + "";
                        print(code);
                        print(phoneNumber);
                        print(data['code']);
                        String errorTitle = 'Incorrect code';
                        String errorDetail =
                            'The code you entered is incorrect. Please try again.';
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
                                                fontSize: FontSize.contentSize,
                                                color: Colors.black)),
                                        onPressed: () {
                                          Navigator.pop(context, 'Cancel');
                                          setState(() {
                                            isLoading = false;
                                          });
                                        },
                                      )
                                    ]));
                      }
                    });
                  },
                )),
          ]),
        ) : Center(child: CircularProgressIndicator()));
  }
}
