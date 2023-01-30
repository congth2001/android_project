import 'package:flutter/material.dart';

import '../models/user.dart';
import '../network/user_request.dart';

class FriendSuggestionPage extends StatefulWidget {
  @override
  _FriendSuggestionPage createState() => _FriendSuggestionPage();
}

class _FriendSuggestionPage extends State<FriendSuggestionPage>
    with SingleTickerProviderStateMixin {
  List<User> users = List<User>.empty();
  @override
  void initState() {
    super.initState();
    UserRequest.getAllUser().then((userList) {
      setState(() {
        users = userList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Suggestion',
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
                children: <Widget>[
                  Text('People You May Know',
                      style: TextStyle(
                          fontSize: 19.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15.0),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/mathew.jpg'),
                        radius: 40.0,
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(users[0].username.toString(),
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
                                  onPressed: () {},
                                  height: 12,
                                  child: Text('Add Friend',
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
                                            color: Colors.black,
                                            fontSize: 15.0)),
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/joey.jpg'),
                        radius: 40.0,
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(users[1].username.toString(),
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
                                  onPressed: () {},
                                  height: 12,
                                  child: Text('Add Friend',
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
                                            color: Colors.black,
                                            fontSize: 15.0)),
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/adelle.jpg'),
                        radius: 40.0,
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(users[2].username.toString(),
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
                                  onPressed: () {},
                                  height: 12,
                                  child: Text('Add Friend',
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
                                            color: Colors.black,
                                            fontSize: 15.0)),
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/timothy.jpg'),
                        radius: 40.0,
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Timothy',
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
                                  onPressed: () {},
                                  height: 12,
                                  child: Text('Add Friend',
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
                                            color: Colors.black,
                                            fontSize: 15.0)),
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/jeremy.jpg'),
                        radius: 40.0,
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Jeremy',
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
                                  onPressed: () {},
                                  height: 12,
                                  child: Text('Add Friend',
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
                                            color: Colors.black,
                                            fontSize: 15.0)),
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/tanya.jpg'),
                        radius: 40.0,
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Tanya',
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
                                  onPressed: () {},
                                  height: 12,
                                  child: Text('Add Friend',
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
                                            color: Colors.black,
                                            fontSize: 15.0)),
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
        ));
  }
}
