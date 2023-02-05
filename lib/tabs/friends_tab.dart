import 'package:flutter/material.dart';
import '../pages/friend_list_page.dart';
import '../pages/friend_request_page.dart';
import '../pages/friend_suggestion_page.dart';
import '../widgets/friend_request_widget.dart';
import '../widgets/friend_suggestion_widget.dart';

import 'package:photo_picker_initial/network/friend_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FriendsTab extends StatefulWidget {
  @override
  _FriendsTabPage createState() => _FriendsTabPage();
}

class _FriendsTabPage extends State<FriendsTab>
    with SingleTickerProviderStateMixin {
  var userID = "";
  var token = "";
  String total = "";
  var friendSuggestList = [];
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
      FriendRequest.getListSuggestedFriends(token).then((data) {
        setState(() {
          // print(data)t;
          friendSuggestList = data['list_users'];
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
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30.0)),
                    child: MaterialButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text('Suggestions',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w500)),
                      onPressed: () => {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => FriendSuggestionPage()),
                        // )
                      },
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30.0)),
                    child: MaterialButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text('Your Friends',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w500)),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FriendListPage()),
                        )
                      },
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30.0)),
                    child: MaterialButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text('Friend request',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w500)),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FriendRequestPage()),
                        )
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Text('People You May Know',
                  style:
                      TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 15.0),
              for (var friendSuggestObj in friendSuggestList)
                Column(
                  children: <Widget>[
                    SuggestionWidget(friendSuggestObj: friendSuggestObj),
                  ],
                ),
              SizedBox(height: 20.0)
            ],
          )),
    );
  }
}
