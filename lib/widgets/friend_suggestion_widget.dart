import 'package:flutter/material.dart';
import 'package:photo_picker_initial/network/user_request.dart';
import '../widgets/friend_request_widget.dart';
import 'package:photo_picker_initial/network/friend_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuggestionWidget extends StatefulWidget {
  var friendSuggestObj = {};
  SuggestionWidget({required this.friendSuggestObj});

  @override
  State<SuggestionWidget> createState() => _SuggestionWidgetState();
}

class _SuggestionWidgetState extends State<SuggestionWidget> {
  var friendSuggest;
  var user;
  var userID = "";
  var token = "";
  bool isAdd = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      friendSuggest = widget.friendSuggestObj;
      print(friendSuggest);
      UserRequest.getUserByID(friendSuggest['user_id'].toString()).then((data) {
        setState(() {
          user = data;
        });
      });
    });
    // print(widget.friendObj['id'].toString());
    getData();
  }

  getData() async {
    try {
      // Gọi đến storage
      final prefs = await SharedPreferences.getInstance();
      // Cập nhật dữ liệu
      setState(() {
        userID = prefs.getString('userID').toString();
        token = prefs.getString('token').toString();
      });
    } catch (e) {
      print('Exception in login_page: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar.toString()),
                    radius: 40.0,
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(user.username.toString(),
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 15.0),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 35,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.blue[700],
                                borderRadius: BorderRadius.circular(5.0)),
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  isAdd = !isAdd;
                                });
                                print(isAdd);
                                FriendRequest.sendFriendInvitation(
                                        token, friendSuggest['user_id'])
                                    .then((data) {
                                  print(data);
                                });
                              },
                              height: 12,
                              child: !isAdd
                                  ? Text('Add Friend',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0))
                                  : Text('Invitation sent',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0)),
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                              height: 35,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text('Remove',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.0)),
                              )),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20.0)
            ],
          )),
    );
  }
}
