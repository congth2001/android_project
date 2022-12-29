import 'package:fakebook/widgets/friend_list_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/friend_list_widget.dart';

class FriendListPage extends StatefulWidget {

  @override
  _FriendListPage createState() => _FriendListPage();
}

class _FriendListPage extends State<FriendListPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Friends', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400)),
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // background
            foregroundColor: Colors.black,
            elevation: 0,
            shape: const CircleBorder(),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
          onPressed: () => {
            Navigator.pop(context)
          },
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
                  borderRadius: BorderRadius.circular(30.0)
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: Colors.grey[800],
                  cursorHeight: 24,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                    hintText: 'Search Friends',
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('100 friends', style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),

                  Container(
                    transform: Matrix4.translationValues(15.0, 0.0, 0.0),
                    child: MaterialButton(
                      elevation: 0,
                      child: Text('Sort', style: TextStyle(color: Colors.blue[700], fontSize: 16)),
                      onPressed: () => {}
                    ),
                  )
                ],
              ),

              FriendListWidget(),
            ]
          )
        )
      )
    );
  }
}