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
  String password = ""; // var for api
  String username = "";
  final codeController = TextEditingController();
  bool isLoading = true;
  String defaultAvatar =
      "https://friconix.com/png/fi-cnsuxx-user-circle-solid.png";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    // Biến toàn cục
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      phoneNumber = prefs.getString('phoneNumber').toString();
      password = prefs.getString('password').toString();
      username = prefs.getString('username').toString();
      isLoading = false;
    });
  }

  setData(var avatar, String token, String userID) async {
    // Biến toàn cục
    final prefs = await SharedPreferences.getInstance();
    String tmpAvatar = avatar == null ? defaultAvatar : avatar;
    print('Im in account_confirm $tmpAvatar');
    // Cập nhật storage
    await prefs.setString('avatar', tmpAvatar);
    await prefs.setString('token', token);
    await prefs.setString('userID', userID);
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
        body: !isLoading
            ? Container(
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
                              style:
                                  TextStyle(fontSize: 12, color: Colors.red)))
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
                              AuthRequest.login(phoneNumber, password)
                                  .then((data) {
                                if (data['code'] == '1000') {
                                  var user = data['data'];
                                  // Cập nhật storage
                                  setData(user['avatar'], user['token'],
                                      user['id']);
                                  // Cập nhật tên người dùng
                                  AuthRequest.changeUsername(
                                          data['data']['token'], username)
                                      .then((data) {
                                    showDialog(
                                        context: context,
                                        builder:
                                            (BuildContext context) => AlertDialog(
                                                    insetPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16),
                                                    title: Text(
                                                        'Next Time, Log In With One Tap',
                                                        style: TextStyle(
                                                            fontSize: FontSize
                                                                .titleSize,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    content: Text(
                                                        "You're now logged into Facebook. Save your password, and you can always log in on this phone by tapping your account.",
                                                        style: TextStyle(
                                                            fontSize: FontSize
                                                                .contentSize,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    88,
                                                                    88,
                                                                    88))),
                                                    actions: [
                                                      TextButton(
                                                        child: Text('NOT NOW',
                                                            style: TextStyle(
                                                                fontSize: FontSize
                                                                    .contentSize,
                                                                color: Colors
                                                                    .black)),
                                                        onPressed: () {
                                                          Navigator.pushAndRemoveUntil(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          HomePage()),
                                                              (route) => false);
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: Text(
                                                            'SAVE PASSWORD',
                                                            style: TextStyle(
                                                                fontSize: FontSize
                                                                    .contentSize,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        10,
                                                                        90,
                                                                        156))),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          showDialog(
                                                              context: context,
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  AlertDialog(
                                                                      insetPadding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              16),
                                                                      title: Text(
                                                                          'Remember your phone number and password',
                                                                          style: TextStyle(
                                                                              fontSize: FontSize
                                                                                  .titleSize,
                                                                              fontWeight: FontWeight
                                                                                  .bold)),
                                                                      content:
                                                                          SizedBox(
                                                                        height:
                                                                            150,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Text("You'll need to enter this any time you log in on a new device.",
                                                                                style: TextStyle(fontSize: FontSize.contentSize, color: Color.fromARGB(255, 88, 88, 88))),
                                                                            SizedBox(height: 10),
                                                                            Align(
                                                                                alignment: Alignment.centerLeft,
                                                                                child: Text("Phone number", style: TextStyle(fontSize: 11, color: Color.fromARGB(255, 88, 88, 88)))),
                                                                            SizedBox(height: 3),
                                                                            Container(
                                                                              padding: const EdgeInsets.only(left: 8),
                                                                              width: double.infinity,
                                                                              height: 30,
                                                                              decoration: BoxDecoration(color: Colors.grey[300]),
                                                                              child: Align(
                                                                                alignment: Alignment.centerLeft,
                                                                                child: Text(phoneNumber, style: TextStyle(color: Colors.black, fontSize: 12)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: 8),
                                                                            Align(
                                                                              alignment: Alignment.centerLeft,
                                                                              child: Text("Password", style: TextStyle(fontSize: 11, color: Color.fromARGB(255, 88, 88, 88))),
                                                                            ),
                                                                            SizedBox(height: 3),
                                                                            Container(
                                                                              padding: const EdgeInsets.only(left: 8),
                                                                              width: double.infinity,
                                                                              height: 30,
                                                                              decoration: BoxDecoration(color: Colors.grey[300]),
                                                                              child: Align(
                                                                                alignment: Alignment.centerLeft,
                                                                                child: Text(password, style: TextStyle(color: Colors.black, fontSize: 12)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      actions: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(horizontal: 16),
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                30,
                                                                            child: TextButton(
                                                                                style: TextButton.styleFrom(backgroundColor: Colors.blue, textStyle: TextStyle()),
                                                                                onPressed: () {
                                                                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginAnotherAccount()), (route) => false);
                                                                                },
                                                                                child: Text('OK', style: TextStyle(color: Colors.white, fontSize: FontSize.contentSize))),
                                                                          ),
                                                                        )
                                                                      ]));
                                                        },
                                                      ),
                                                    ]));
                                  });
                                }
                              });
                            } else {
                              var code = codeController.text + "";
                              String errorTitle = 'Incorrect code';
                              String errorDetail =
                                  'The code you entered is incorrect. Please try again.';
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                          insetPadding: EdgeInsets.symmetric(
                                              horizontal: 32),
                                          title: Text(errorTitle,
                                              style: TextStyle(
                                                  fontSize: FontSize.titleSize,
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
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              },
                                            )
                                          ]));
                            }
                          }).catchError((e) {
                            print('Exception in account_confirmation: $e');
                          });
                        },
                      )),
                ]),
              )
            : Center(child: CircularProgressIndicator()));
  }
}
