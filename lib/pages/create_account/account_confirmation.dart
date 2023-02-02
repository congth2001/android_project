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
        body: Container(
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
              maxLength: 6,
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
                    if (isValid) {
                      AuthRequest.checkVerifyCode(phoneNumber, code)
                          .then((data) async {
                        // Thành công
                        if (data['code'] == '1000') {
                          // Direct to next page
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginAnotherAccount()),
                              (route) => false);
                        } else {
                          // Hiển thị dialog cảnh báo tại đây
                          print(data['details']);
                        }
                      });
                    } else {
                      // Hiển thị cảnh báo tại đây
                    }
                  },
                )),
          ]),
        ));
  }
}
