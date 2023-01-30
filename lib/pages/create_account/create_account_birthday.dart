// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:fakebook/pages/create_account/create_account_mobile_number.dart';
import 'package:fakebook/pages/landing_page.dart';
import 'package:fakebook/shared/font_size.dart';
import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccountBirthday extends StatefulWidget {
  const CreateAccountBirthday({Key? key}) : super(key: key);

  @override
  State<CreateAccountBirthday> createState() => _CreateAccountBirthdayState();
}

class _CreateAccountBirthdayState extends State<CreateAccountBirthday> {
  bool isValid = true;
  DateTime selectedDate = DateTime(
      DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);

  int calculateAge(DateTime date) {
    return (DateTime.now().month > date.month ||
            (DateTime.now().month == date.month &&
                DateTime.now().day >= date.day))
        ? (DateTime.now().year - date.year)
        : (DateTime.now().year - date.year - 1);
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
            title: Text('Birthday',
                style: TextStyle(
                    color: Colors.black, fontSize: FontSize.titleSize))),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 80),
                Text("What's your birthday?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.titleSize)),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    isValid
                        ? 'Choose your date of birth. You can always make this private later.'
                        : 'It looks like you entered the wrong info. Please be sure to use your real birthday and your age is at least 13.',
                    style: TextStyle(
                        color: isValid ? Colors.black : Colors.red,
                        fontSize: FontSize.contentSize),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                        height: 100,
                        child: ScrollDatePicker(
                            selectedDate: selectedDate,
                            locale: Locale('en'),
                            maximumDate: DateTime.now(),
                            minimumDate: DateTime(1905, 01, 01),
                            onDateTimeChanged: (DateTime value) {
                              setState(() {
                                selectedDate = value;
                              });
                            }))),
                SizedBox(height: 30),
                Text(calculateAge(selectedDate).toString() + ' Years old',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.contentSize)),
                SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: ElevatedButton(
                        onPressed: () {
                          if (calculateAge(selectedDate) < 13) {
                            setState(() {
                              isValid = false;
                            });
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MobileNumberPage()));
                          }
                        },
                        child: Text('Next',
                            style: TextStyle(fontSize: FontSize.contentSize))),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
