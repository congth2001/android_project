// ignore_for_file: prefer_const_constructors

import 'package:fakebook/pages/landing_page.dart';
import 'package:flutter/material.dart';
import '../../shared/font_size.dart';
import 'login_page.dart';

class FindAccountPage extends StatefulWidget {
  const FindAccountPage({Key? key}) : super(key: key);

  @override
  State<FindAccountPage> createState() => _FindAccountPageState();
}

class _FindAccountPageState extends State<FindAccountPage> {
  String type = "Phone";
  final inputController = TextEditingController();
  bool isValid = true;
  bool isFound = false;

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black, size: 20),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LandingPage()));
                }),
            backgroundColor: Colors.white,
            title: Text('Find your account',
                style: TextStyle(
                    color: Colors.black, fontSize: FontSize.titleSize))),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          height: (height - 40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 40),
                    Center(
                        child: Text(
                            !isFound ? (type == 'Phone'
                                ? 'Enter Your Phone Number'
                                : 'Enter Your Email') : 'Enter Your Phone number or Choose Your Account',
                            style: TextStyle(
                                fontSize: FontSize.titleSize,
                                fontWeight: FontWeight.bold))),
                    SizedBox(height: 10),
                    TextField(
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              isValid = true;
                            });
                          }
                        },
                        controller: inputController,
                        style: TextStyle(fontSize: FontSize.contentSize),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon:
                                Icon(Icons.clear, color: Colors.grey, size: 16),
                            onPressed: () {
                              inputController.clear();
                              setState(() {
                                isFound = false;
                              });
                            },
                          ),
                          labelText: type == 'Phone' ? 'Phone' : 'Email',
                        )),
                    SizedBox(height: 10),
                    !isValid
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                type == 'Phone'
                                    ? 'Enter your phone'
                                    : 'Enter your email',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.red)))
                        : Text(''),
                    SizedBox(
                      height: 10,
                    ),
                    !isFound ? SizedBox(
                      width: double.infinity,
                      height: 30,
                      child: ElevatedButton(
                          onPressed: () {
                            if (inputController.text.isEmpty) {
                              setState(() {
                                isValid = false;
                              });
                            } else {
                              setState(() {
                                isFound = true;
                              });
                              if (!isFound) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                            insetPadding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                            title: Text(
                                                'No accounts match that information.',
                                                style: TextStyle(
                                                    fontSize:
                                                        FontSize.titleSize,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            content: Text(
                                                "Make sure you've entered the correct phone number or email address.",
                                                style: TextStyle(
                                                    fontSize:
                                                        FontSize.contentSize,
                                                    color: Color.fromARGB(
                                                        255, 88, 88, 88))),
                                            actions: [
                                              TextButton(
                                                child: Text(
                                                    'SEARCH AGAIN',
                                                    style: TextStyle(
                                                        fontSize: FontSize
                                                            .contentSize,
                                                        color: Color.fromARGB(
                                                            255, 10, 90, 156))),
                                                onPressed: () {
                                                  inputController.clear();
                                                  Navigator.pop(context, 'Search again');
                                                },
                                              ),
                                            ]));
                              }
                            }
                          },
                          child: Text(
                            'Find Your Account',
                            style: TextStyle(fontSize: FontSize.contentSize),
                          )),
                    )
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            textStyle: TextStyle()),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/andrew.jpg'),
                                    radius: 25,
                                  )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Andrew',
                                      style: TextStyle(
                                          fontSize: FontSize.titleSize,
                                          color: Colors.black)),
                                          Text('Facebook User', style: TextStyle(color: Colors.grey, fontSize: 13))
                                ],
                              )
                            ]),
                          ])),
                          Divider(thickness: 1,color: Colors.grey[400]),
                          
                      ],
                    )
                  ],
                ),
                if(!isFound) Center(
                    child: TextButton(
                  child: Text(
                      type == 'Phone'
                          ? 'Search by your email instead'
                          : 'Search by your phone instead',
                      style: TextStyle(
                          fontSize: FontSize.contentSize, color: Colors.blue)),
                  onPressed: () {
                    setState(() {
                      type = type == 'Phone' ? 'Email' : 'Phone';
                    });
                  },
                ))
              ]),
        )));
  }
}
