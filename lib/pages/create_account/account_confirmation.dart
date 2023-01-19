// ignore_for_file: prefer_const_constructors

import 'package:fakebook/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/font_size.dart';

class AccountConfirmationPage extends StatefulWidget {
  const AccountConfirmationPage({Key? key}) : super(key: key);

  @override
  State<AccountConfirmationPage> createState() => _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
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
            Text(
              'Enter the code', 
            style: TextStyle(color: Colors.black, fontSize: FontSize.titleSize, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(fontSize: FontSize.contentSize),
              decoration: InputDecoration(
                hintText: 'Confirmation code',
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: ElevatedButton(
                    child: Text('Confirm', style: TextStyle(fontSize: FontSize.contentSize),),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                    },
                  )),
          ]),
        ));
  }
}