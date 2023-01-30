import 'dart:io';

import 'package:fakebook/widgets/separator_widget.dart';
import 'package:fakebook/widgets/what_on_your_.dart';
import 'package:flutter/material.dart';

import '../pages/edit_profile_page.dart';
import '../pages/friend_list_page.dart';
import '../pages/profile_setting_page.dart';
import 'friends_tab.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 380.0,
          child: Stack(
            children: <Widget>[
              Stack(alignment: Alignment.bottomRight, children: [
                Container(
                  height: 220.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/cover.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 10,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuilderContext) {
                                  return SizedBox(
                                      height: 120,
                                      child: Container(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 8, right: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                hoverColor: Colors.white,
                                                onTap: () {},
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                        Icons
                                                            .photo_size_select_actual,
                                                        color: Colors.black),
                                                    SizedBox(width: 10),
                                                    Text('View profile cover',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 15),
                                              InkWell(
                                                hoverColor: Colors.white,
                                                onTap: () {},
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.file_upload,
                                                        color: Colors.black),
                                                    SizedBox(width: 10),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('Upload photo',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10)
                                            ],
                                          )));
                                });
                          },
                          icon: Icon(Icons.photo_camera,
                              color: Colors.black, size: 25))),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Stack(alignment: Alignment.bottomRight, children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/Mike Tyler.jpg'),
                          radius: 80.0,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 10,
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuilderContext) {
                                        return SizedBox(
                                            height: 120,
                                            child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 15, left: 8, right: 8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    InkWell(
                                                      hoverColor: Colors.white,
                                                      onTap: () {},
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                              Icons
                                                                  .photo_library,
                                                              color:
                                                                  Colors.black),
                                                          SizedBox(width: 10),
                                                          Text(
                                                              'Select profile picture',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )));
                                      });
                                },
                                icon: Icon(Icons.photo_camera,
                                    color: Colors.black, size: 25))),
                      ),
                    ]),
                    const SizedBox(height: 10.0),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text('Mike Tyler',
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.post_add, color: Colors.white),
                                Text(' Create',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0)),
                              ],
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditProfilePage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.edit, color: Colors.black),
                                  Text(' Edit profile',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0)),
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
                                            ProfileSettingPage()));
                              },
                            ),
                          )
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
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>FriendListPage())
                      );
                    },
                    child: Column(
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
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>FriendsTab())
                      );
                    },
                    child: Text('Find Friends',
                        style:
                            TextStyle(fontSize: 16.0, color: Colors.blue[700])),
                  ),
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
              WriteSomethingWidget(),
              Container(
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
    ));
  }
}
