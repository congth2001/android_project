import 'package:fakebook/tabs/friends_tab.dart';
import 'package:flutter/material.dart';

class FriendPage extends StatefulWidget {
  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // background
            foregroundColor: Colors.black,
            elevation: 0,
            shape: const CircleBorder(),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
          onPressed: () => {Navigator.pop(context)},
        ),
        title: Container(
          transform: Matrix4.translationValues(15.0, 0.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 100),
              Text('Friends',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18)),
              SizedBox(width: 90),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // background
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: const CircleBorder(),
                ),
                child: const Icon(Icons.search, color: Colors.black, size: 24),
                onPressed: () => {},
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: FriendsTab(),
    );
  }
}
