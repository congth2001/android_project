// ignore_for_file: prefer_const_constructors

import 'package:photo_picker_initial/shared/font_size.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black, size: 20),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.white,
            title: Text('Edit Profile',
                style: TextStyle(
                    color: Colors.black, fontSize: FontSize.titleSize))),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Profile Picture',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      TextButton(
                          onPressed: () {},
                          child: Text('Edit',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue)))
                    ],
                  ),
                  SizedBox(height: 10),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/Mike Tyler.jpg'),
                    radius: 60.0,
                  ),
                ])),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cover Photo',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      TextButton(
                          onPressed: () {},
                          child: Text('Edit',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue)))
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 220.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/cover.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ])),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bio',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      TextButton(
                          onPressed: () {},
                          child: Text('Add',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue)))
                    ],
                  ),
                  SizedBox(height: 10),
                  TextButton(
                      onPressed: () {},
                      child: Text('Describe yourself...',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)))
                ])),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      TextButton(
                          onPressed: () {},
                          child: Text('Edit',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue)))
                    ],
                  ),
                  SizedBox(height: 10),
                ])),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Link',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      TextButton(
                          onPressed: () {},
                          child: Text('Add',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue)))
                    ],
                  )
                ])),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 35,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 212, 229, 245),
                        textStyle: TextStyle()),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.person_outline, color: Colors.blue),
                        SizedBox(width: 5),
                        Text('Edit Your About Info',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: FontSize.contentSize)),
                      ],
                    )),
              ),
            )
          ],
        )));
  }
}
