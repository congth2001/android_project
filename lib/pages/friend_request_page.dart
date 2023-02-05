import 'package:flutter/material.dart';

import '../widgets/friend_request_widget.dart';
import 'package:photo_picker_initial/network/friend_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FriendRequestPage extends StatefulWidget {
  @override
  _FriendRequestPage createState() => _FriendRequestPage();
}

class _FriendRequestPage extends State<FriendRequestPage>
    with SingleTickerProviderStateMixin {
  var userID = "";
  var token = "";
  String total = "";
  var friendRequestList = [];
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
      FriendRequest.getRequestedList(token).then((data) {
        setState(() {
          // print(data);
          friendRequestList = data['request'];
          total = data['total'];

          // print(friendRequestList);
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
          title: const Text('Requests',
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
                      Row(
                        children: <Widget>[
                          Text('Friend Requests',
                              style: TextStyle(
                                  fontSize: 19.0, fontWeight: FontWeight.bold)),
                          SizedBox(width: 10.0),
                          Text(total,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                          SizedBox(width: 100),
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
                      for (var friendRequestObj in friendRequestList)
                        Column(
                          children: <Widget>[
                            RequestWidget(friendRequestObj: friendRequestObj),
                          ],
                        ),
                    ]))));
  }
}
