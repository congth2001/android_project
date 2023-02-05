import 'dart:convert';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_picker_initial/models/user.dart';
import 'package:photo_picker_initial/network/auth_request.dart';
import 'package:photo_picker_initial/network/user_request.dart';
import 'package:photo_picker_initial/widgets/separator_widget.dart';
import 'package:photo_picker_initial/widgets/what_on_your_.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../pages/edit_profile_page.dart';
import '../../pages/profile_setting_page.dart';
import '../widgets/common_buttons.dart';
import '../constants.dart';
import 'select_photo_options_screen.dart';

class ProfileTab extends StatefulWidget {
  // const ProfileTab({super.key});
  static const id = 'set_photo_screen';
  final String? userID;

  const ProfileTab({Key? key, this.userID}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool isMe = false;
  bool isFriend = false;
  bool isReceivedRequestFromMe = false;
  bool isSendRequestToMe = false;
  bool isLoading = true;
  var user = User();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    String meID = prefs.getString('userID').toString();
    if(widget.userID != null){
      if(widget.userID == meID){
        setState(() {
          isMe = true;
        });
      }else{
        setState((){
          isMe = false;
          isFriend = true;
        });
      }
      UserRequest.getUserByID(widget.userID!).then((data) {
      setState(() {
        user = data;
        isLoading = false;
      });
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading ? SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 380.0,
          child: Stack(
            children: <Widget>[
              Container(
                height: 220.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(user.coverImage.toString()),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                        ),
                        child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(user.avatar.toString()),
                            radius: 80)),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(user.username.toString(),
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 38.0,
                            width: MediaQuery.of(context).size.width / 2 - 48,
                            decoration: BoxDecoration(
                                color: Colors.blue[700],
                                borderRadius: BorderRadius.circular(5.0)),
                            child: isMe
                            ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add_circle, color: Colors.white),
                                Text(' Add to story',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0)),
                              ],
                            )
                            : isFriend 
                            ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.person, color: Colors.white),
                                Text(' Friends',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0)),
                              ],
                            )
                            : isReceivedRequestFromMe
                            ? InkWell(
                              onTap: (){
                                setState(() {
                                  isReceivedRequestFromMe = false;
                                  isSendRequestToMe = false;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.person_add, color: Colors.white),
                                  Text(' Requested',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0)),
                                ],
                              ),
                            )
                            : isSendRequestToMe
                            ? InkWell(
                              onTap: (){
                                showBottomSheet(context: context, builder: (builder){
                                  return SizedBox(
                                    height: 100,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: (){},
                                            child: Row(
                                              children: [
                                                Icon(Icons.check, color: Colors.black),
                                                SizedBox(width: 10),
                                                Text('Confirm', style: TextStyle(color: Colors.black, fontSize: 14))
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          InkWell(
                                            onTap: (){},
                                            child: Row(
                                              children: [
                                                Icon(Icons.cancel, color: Colors.black),
                                                SizedBox(width: 10),
                                                Text('Cancel', style: TextStyle(color: Colors.black, fontSize: 14))
                                              ],
                                            ),
                                          )
                                        ]
                                      )
                                    )
                                  );
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.person, color: Colors.white),
                                  Text(' Respond',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0)),
                                ],
                              ),
                            )
                            : InkWell(
                              onTap: (){
                                setState((){
                                  isReceivedRequestFromMe = true;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.person_add, color: Colors.white),
                                  Text(' Add Friend',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 38.0,
                            width: MediaQuery.of(context).size.width / 2 - 48,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.0)),
                            child: InkWell(
                              onTap: () {
                                if(isMe) Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditProfilePage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(isMe ? Icons.edit : FontAwesomeIcons.facebookMessenger, color: Colors.black),
                                  SizedBox(width: 5),
                                  Text(isMe ? ' Edit profile' : 'Message',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16.0)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                              height: 38.0,
                              width: 46.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: IconButton(
                                icon: Icon(Icons.more_horiz),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileSettingPage(isMe: isMe)));
                                },
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        SeparatorWidget(),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text('Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.home, color: Colors.grey, size: 30.0),
                  SizedBox(width: 10.0),
                  Text('Lives in New York', style: TextStyle(fontSize: 16.0))
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                children: <Widget>[
                  Icon(Icons.location_on, color: Colors.grey, size: 30.0),
                  SizedBox(width: 10.0),
                  Text('From New York', style: TextStyle(fontSize: 16.0))
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                children: <Widget>[
                  Icon(Icons.more_horiz, color: Colors.grey, size: 30.0),
                  SizedBox(width: 10.0),
                  Text('See your About Info', style: TextStyle(fontSize: 16.0))
                ],
              ),
              SizedBox(height: 15.0),
              Container(
                height: 35.0,
                decoration: BoxDecoration(
                  color: Colors.blue[100]?.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                    child: Text('Edit Public Details',
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0))),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Friends',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 6.0),
                      Text('536 friends',
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.grey[600])),
                    ],
                  ),
                  Text('Find Friends',
                      style:
                          TextStyle(fontSize: 16.0, color: Colors.blue[700])),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.width / 3 - 20,
                          width: MediaQuery.of(context).size.width / 3 - 20,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/samantha.jpg')),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        SizedBox(height: 5.0),
                        Text('Samantha',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w500))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.width / 3 - 20,
                          width: MediaQuery.of(context).size.width / 3 - 20,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/andrew.jpg')),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        SizedBox(height: 5.0),
                        Text('Andrew',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w500))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.width / 3 - 20,
                          width: MediaQuery.of(context).size.width / 3 - 20,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/Sam Wilson.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        SizedBox(height: 5.0),
                        Text('Sam Wilson',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.width / 3 - 20,
                          width: MediaQuery.of(context).size.width / 3 - 20,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/steven.jpg')),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        SizedBox(height: 5.0),
                        Text('Steven',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w500))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.width / 3 - 20,
                          width: MediaQuery.of(context).size.width / 3 - 20,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/greg.jpg')),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        SizedBox(height: 5.0),
                        Text('Greg',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w500))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.width / 3 - 20,
                          width: MediaQuery.of(context).size.width / 3 - 20,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/andy.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        SizedBox(height: 5.0),
                        Text('Andy',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.0),
                height: 35.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                    child: Text('See All Friends',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0))),
              ),
            ],
          ),
        ),
        SeparatorWidget(),
        Container(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Posts',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text('Filters',
                        style:
                            TextStyle(color: Colors.blue[700], fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              if(isMe) WriteSomethingWidget(),
              if(isMe) Container(
                margin: EdgeInsets.all(15),
                height: 35.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.newspaper, color: Colors.black),
                    Text(' Manage posts',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0)),
                  ],
                ),
              ),
            ],
          ),
        ),
        SeparatorWidget(),
        Container(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 35.0,
                width: MediaQuery.of(context).size.width / 3 - 30,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.photo_library),
                    Text(' Photos',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.0)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 35.0,
                width: MediaQuery.of(context).size.width / 3 - 30,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.account_circle),
                    Text(' Avatars',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.0)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 35.0,
                width: MediaQuery.of(context).size.width / 3 - 40,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.music_note),
                    Text('Music',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.0)),
                  ],
                ),
              ),
            ],
          ),
        ),
        SeparatorWidget(),
      ],
    )) : Center(child: CircularProgressIndicator());
  }
}
