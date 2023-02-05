import 'package:flutter/material.dart';
import 'package:photo_picker_initial/network/user_request.dart';
import 'package:photo_picker_initial/network/friend_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestWidget extends StatefulWidget {
  var friendRequestObj = {};
  RequestWidget({required this.friendRequestObj});

  @override
  State<RequestWidget> createState() => _RequestWidgetState();
}

class _RequestWidgetState extends State<RequestWidget> {
  var friendRequest;
  var user;
  var userID = "";
  var token = "";
  bool isConfirm = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      friendRequest = widget.friendRequestObj;
      print(friendRequest);
      UserRequest.getUserByID(friendRequest['id'].toString()).then((data) {
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
        //padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar.toString()),
                    radius: 30.0,
                  ),
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
                                isConfirm = !isConfirm;
                              });
                              FriendRequest.setAcceptFriend(
                                      token, friendRequest['id'], '1')
                                  .then((data) {
                                //setState(() {
                                // print(data)t;
                                // friendSuggestList = data['list_users'];

                                // print(friendRequestList);
                                //});
                                print(data);
                              });
                            },
                            height: 12,
                            child: !isConfirm
                                ? Text('Confirm',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.0))
                                : Text('Friend',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.0)),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                            height: 35,
                            width: 87,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.0)),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text('Delete',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0)),
                            )),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
