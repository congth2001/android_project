// ignore_for_file: prefer_const_constructors

import 'package:fakebook/pages/create_account/create_account_birthday.dart';
import 'package:fakebook/pages/landing_page.dart';
import 'package:fakebook/shared/font_size.dart';
import 'package:flutter/material.dart';

class CreateAccountName extends StatefulWidget {
  const CreateAccountName({Key? key}) : super(key: key);

  @override
  State<CreateAccountName> createState() => _CreateAccountNameState();
}

class _CreateAccountNameState extends State<CreateAccountName> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  bool isValid = true;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
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
                        insetPadding: EdgeInsets.symmetric(horizontal: 16),
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
                                          fontSize: FontSize.contentSize, color: Colors.black)),
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
            title: Text('Name',
                style: TextStyle(color: Colors.black, fontSize: FontSize.titleSize))),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 80),
                Text("What's your name?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: FontSize.titleSize)),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                      isValid
                          ? 'Enter the name you use in real life.'
                          : 'Please enter your first and last name.',
                      style: TextStyle(color: isValid ? Colors.black : Colors.red, fontSize: FontSize.contentSize),
                      textAlign: TextAlign.center,),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Expanded(
                          flex: 1,
                          child: TextField(
                            onChanged: (text){
                              if(text.isNotEmpty){
                                setState(() {
                                  isValid = true;
                                });
                              }
                            },
                            controller: firstNameController,
                            style: TextStyle(fontSize: FontSize.contentSize),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(Icons.clear, color: Colors.grey, size: 16),
                                  onPressed: (){
                                    firstNameController.clear();
                                  },
                                ),
                                labelText: 'First Name',
                                labelStyle: TextStyle(
                                    color: isValid ? Colors.grey : Colors.red),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            isValid ? Colors.grey : Colors.red)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            isValid ? Colors.blue : Colors.red))),
                          )),
                      SizedBox(width: 10),
                      Expanded(
                          flex: 1,
                          child: TextField(
                            onChanged: (text){
                              if(text.isNotEmpty){
                                setState(() {
                                  isValid = true;
                                });
                              }
                            },
                            style: TextStyle(fontSize: FontSize.contentSize),
                            controller: lastNameController,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.clear, color: Colors.grey, size: 16),
                                  onPressed: (){
                                    lastNameController.clear();
                                  },
                                ),
                                labelText: 'Last Name',
                                labelStyle: TextStyle(
                                    color: isValid ? Colors.grey : Colors.red),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            isValid ? Colors.grey : Colors.red)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            isValid ? Colors.blue : Colors.red))),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: ElevatedButton(
                        onPressed: () {
                          if (firstNameController.text == '' ||
                              lastNameController.text == '') {
                            setState(() {
                              isValid = false;
                            });
                          }else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>CreateAccountBirthday())
                            );
                          }
                        },
                        child: Text('Next', style: TextStyle(fontSize: FontSize.contentSize),)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
