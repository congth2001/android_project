// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/font_size.dart';

class CreatePostMain extends StatefulWidget {
  const CreatePostMain({Key? key}) : super(key: key);

  @override
  State<CreatePostMain> createState() => _CreatePostMainState();
}

class _CreatePostMainState extends State<CreatePostMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 40,
            leading: IconButton(
                icon:
                    const Icon(Icons.arrow_back, color: Colors.black, size: 20),
                onPressed: () {}),
            backgroundColor: Colors.white,
            title: Row(
              children: [
                const Text('Create post',
                    style: TextStyle(
                        color: Colors.black, fontSize: FontSize.titleSize)),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('POST', style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            )),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.red,
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/andrew.jpg"))),
                  ),
                  SizedBox(width: 5),
                  Column(children: [
                    Text('Andrew',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: FontSize.titleSize)),
                    SizedBox(height: 4),
                    Container(
                        height: 20,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Color.fromARGB(255, 201, 200, 200)),
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.public, color: Colors.grey, size: 12),
                              SizedBox(width: 3),
                              Text('Public', style: TextStyle(fontSize: 11))
                            ])),
                  ])
                ],
              )
              ,
              Container(
                color: Colors.green,
                height: 500,
                width: 200,
                child: TextField(
                  maxLines: 20,
                ))
            ]),
          ),
        ),
        bottomSheet: Container(
            height: 90,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey))),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey),
                      )),
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.photo_library, color: Colors.green),
                          SizedBox(width: 8),
                          Text('Photo/video',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: FontSize.contentSize)),
                        ],
                      )),
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.insert_emoticon, color: Colors.orange),
                          SizedBox(width: 8),
                          Text('Feeling/activity',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: FontSize.contentSize)),
                        ],
                      )),
                )
              ],
            )));
  }
}
