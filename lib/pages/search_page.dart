import 'package:fakebook/widgets/friend_list_widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            cursorColor: Colors.grey[800],
            cursorHeight: 24,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
              hintText: 'Search',
              border: InputBorder.none,
            ),
          ),
        ),
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
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Recent searches', style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),

                  Container(
                    transform: Matrix4.translationValues(15.0, 0.0, 0.0),
                    child: MaterialButton(
                      elevation: 0,
                      child: Text('See all', style: TextStyle(color: Colors.blue[700], fontSize: 16)),
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