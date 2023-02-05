// import 'dart:html';

import 'package:photo_picker_initial/widgets/friend_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:photo_picker_initial/network/friend_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FriendListPage extends StatefulWidget {
  @override
  _FriendListPage createState() => _FriendListPage();
}

class _FriendListPage extends State<FriendListPage>
    with SingleTickerProviderStateMixin {
//  List<User> friendList = List<User>.empty();
  var friendList = [];
  var userID = "";
  var token = "";
  String total = "";
  @override
  void initState() {
    super.initState();
    // setState(() {
    //   postObj = widget.post;
    //   numberOfLikes = postObj.like.toString();
    // });
    getData();
  }

  getData() async {
    try {
      // Gọi đến storage
      final prefs = await SharedPreferences.getInstance();
      // Cập nhật dữ liệu
      userID = prefs.getString('userID').toString();
      token = prefs.getString('token').toString();
      FriendRequest.getUserFriendList(token, userID).then((data) {
        setState(() {
          // print(data);
          friendList = data['friends'];
          total = data['total'];
          print(friendList);
          print(total);
        });
      });
    } catch (e) {
      print('Exception in login_page: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Friends',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400)),
          leading: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // background
              foregroundColor: Colors.black,
              elevation: 0,
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
            onPressed: () => {Navigator.pop(context)},
          ),
          backgroundColor: Colors.white,
          elevation: 0.5,
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                color: Colors.white,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30.0)),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Colors.grey[800],
                          cursorHeight: 24,
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.search, color: Colors.grey[500]),
                            hintText: 'Search Friends',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(total.toString() + " friends",
                              style: TextStyle(
                                  fontSize: 19.0, fontWeight: FontWeight.bold)),
                          Container(
                            transform:
                                Matrix4.translationValues(15.0, 0.0, 0.0),
                            child: MaterialButton(
                                elevation: 0,
                                child: Text('Sort',
                                    style: TextStyle(
                                        color: Colors.blue[700], fontSize: 16)),
                                onPressed: () => {}),
                          )
                        ],
                      ),

                      // FriendWidget(friendList: friendList),
                      for (var friendObj in friendList)
                        Column(
                          children: <Widget>[
                            FriendWidget(friendObj: friendObj),
                          ],
                        ),
                    ]))));
  }
}
