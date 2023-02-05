import 'package:flutter/material.dart';
import '../pages/friend_list_page.dart';
import '../pages/friend_request_page.dart';
import '../pages/friend_suggestion_page.dart';
import '../widgets/friend_request_widget.dart';
import '../widgets/friend_suggestion_widget.dart';

class FriendsTab extends StatelessWidget {
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
                              fontSize: 16.0, fontWeight: FontWeight.w500)),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FriendSuggestionPage()),
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
                      child: Text('Your Friends',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500)),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FriendListPage()),
                        )
                      },
                    ),
                  ),
                ],
              ),
              Divider(height: 30.0, thickness: 1),
              Row(
                children: <Widget>[
                  Text('Friend Requests',
                      style: TextStyle(
                          fontSize: 19.0, fontWeight: FontWeight.bold)),
                  SizedBox(width: 10.0),
                  Text('8',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red)),
                  SizedBox(width: 100),
                  Container(
                    transform: Matrix4.translationValues(15.0, 0.0, 0.0),
                    child: MaterialButton(
                      elevation: 0,
                      child: Text('See All',
                          style:
                              TextStyle(color: Colors.blue[700], fontSize: 16)),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FriendRequestPage()),
                        )
                      },
                    ),
                  )
                ],
              ),
              RequestWidget(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70.0,
                child: Row(
                  children: [
                    MaterialButton(
                      elevation: 0,
                      height: 35,
                      minWidth: MediaQuery.of(context).size.width - 30,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Colors.grey[300],
                      child: const Text('See all',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500)),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FriendRequestPage()),
                        )
                      },
                    ),
                  ],
                ),
              ),
              Divider(height: 10.0, thickness: 1),
              SizedBox(height: 15.0),
              Text('People You May Know',
                  style:
                      TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 15.0),
              SuggestionWidget(),
              SizedBox(height: 20.0)
            ],
          )),
    );
  }
}
