// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';
import 'package:photo_picker_initial/network/post_request.dart';
import 'package:photo_picker_initial/network/user_request.dart';
import 'package:photo_picker_initial/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../shared/font_size.dart';
import 'feelings_activities_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:photo_picker_initial/network/auth_request.dart';
import 'package:photo_picker_initial/models/user.dart';

class CreatePostMain extends StatefulWidget {
  final String? emoijOrActivityImage;
  final String? emoijOrActivityName;
  final String? emojiOrActivityType;
  const CreatePostMain(
      {Key? key,
      this.emoijOrActivityImage,
      this.emoijOrActivityName,
      this.emojiOrActivityType})
      : super(key: key);

  @override
  State<CreatePostMain> createState() => _CreatePostMainState();
}

class _CreatePostMainState extends State<CreatePostMain> {
  final contentController = TextEditingController();
  bool isDisabled = true;
  bool isFocus = false;

  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    if (widget.emojiOrActivityType != null &&
        widget.emojiOrActivityType != '') {
      setState(() {
        isDisabled = false;
      });
    }
    getData();
  }

  var user = User();
  getData() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    String userID = prefs.getString('userID').toString();
    // Gọi API lấy thông tin người dùng
    UserRequest.getUserByID(userID).then((data) {
      if (data['code'] == '1000') {
        setState(() {
          user = data['data'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 40,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
              onPressed: () {
                if (isDisabled)
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()),
                      (route) => false);
                else {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuilderContext) {
                        return SizedBox(
                            height: 200,
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Want to finish your post later?',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Save it as a draft or you can continue editing it.',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey[500]),
                                    ),
                                    SizedBox(height: 15),
                                    InkWell(
                                      hoverColor: Colors.white,
                                      onTap: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        HomePage()),
                                            (route) => false);
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.bookmark_border,
                                              color: Colors.grey),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Save as draft',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  "You'll receive a notification with your draft.",
                                                  style: TextStyle(
                                                      color: Colors.grey[500],
                                                      fontSize: 10))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    InkWell(
                                      hoverColor: Colors.white,
                                      onTap: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        HomePage()),
                                            (route) => false);
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.delete,
                                              color: Colors.grey),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Discard post',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    InkWell(
                                      hoverColor: Colors.white,
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.check, color: Colors.blue),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Continue editing',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15)
                                  ],
                                )));
                      });
                }
              }),
          backgroundColor: Colors.white,
          elevation: 0.5,
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
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isDisabled ? Colors.grey[200] : Colors.blue,
                        shadowColor: Colors.white),
                    onPressed: () async {
                      if (contentController.text != "") {
                        // Get description
                        String described = contentController.text;
                        // Call API
                        print(described);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    },
                    child: Text('DONE',
                        style: TextStyle(
                            color:
                                isDisabled ? Colors.grey[400] : Colors.white)),
                  ))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(user.avatar.toString()))),
                  ),
                  SizedBox(width: 5),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(user.name.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSize.contentSize)),
                            if (widget.emoijOrActivityName != null &&
                                widget.emoijOrActivityName != '')
                              Text(' - '),
                            if (widget.emoijOrActivityImage != null &&
                                widget.emoijOrActivityImage != '')
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    widget.emoijOrActivityImage ?? ''),
                                radius: 10,
                              ),
                            Text(' '),
                            if (widget.emoijOrActivityName != null &&
                                widget.emojiOrActivityType == 'emoji' &&
                                widget.emoijOrActivityName != '')
                              Text('Feeling',
                                  style: TextStyle(
                                      fontSize: FontSize.contentSize,
                                      color: Colors.grey)),
                            Text(' '),
                            Text(widget.emoijOrActivityName ?? '',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSize.contentSize)),
                            if (widget.emoijOrActivityName != null &&
                                widget.emoijOrActivityName != '')
                              Text('.')
                          ],
                        ),
                        SizedBox(height: 4),
                        Container(
                            height: 20,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Color.fromARGB(255, 201, 200, 200)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.public,
                                      color: Colors.grey, size: 12),
                                  SizedBox(width: 3),
                                  Text('Public', style: TextStyle(fontSize: 11))
                                ])),
                      ])
                ],
              ),
              Container(
                  width: width - 32,
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        isFocus = true;
                      });
                    },
                    child: TextField(
                      controller: contentController,
                      onChanged: (text) {
                        if (widget.emojiOrActivityType == null ||
                            widget.emojiOrActivityType == '') {
                          if (text.isNotEmpty) {
                            setState(() {
                              isDisabled = false;
                            });
                          } else {
                            setState(() {
                              isDisabled = true;
                            });
                          }
                        }
                      },
                      maxLines: 25,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          hintText: "What's on your mind?",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: InputBorder.none),
                    ),
                  )),
            ]),
          ),
        ),
        bottomSheet: !isFocus
            ? Container(
                height: 110,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(color: Colors.grey))),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(color: Colors.grey),
                          )),
                      child: TextButton(
                          onPressed: () {
                            myAlert();
                          },
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
                    image != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                //to show image, you type like this.
                                File(image!.path),
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                              ),
                            ),
                          )
                        : Container(),
                    Container(
                      width: double.infinity,
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        FeelingsAndActivities(
                                            avatar:
                                                widget.emoijOrActivityImage ??
                                                    '',
                                            name: widget.emoijOrActivityName ??
                                                '',
                                            type: widget.emojiOrActivityType ??
                                                '')),
                                (route) => false);
                          },
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
                ))
            : Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(color: Colors.grey),
                        bottom: BorderSide(color: Colors.grey))),
                child: Row(
                  children: [
                    Text('Add to your post'),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.photo_library, color: Colors.green),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    FeelingsAndActivities(
                                        avatar:
                                            widget.emoijOrActivityImage ?? '',
                                        name: widget.emoijOrActivityName ?? '',
                                        type:
                                            widget.emojiOrActivityType ?? '')),
                            (route) => false);
                      },
                      icon: Icon(Icons.insert_emoticon, color: Colors.orange),
                    )
                  ],
                ),
              ));
  }
}
