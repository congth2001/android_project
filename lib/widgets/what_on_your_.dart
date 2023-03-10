import 'package:photo_picker_initial/network/user_request.dart';
import 'package:photo_picker_initial/pages/create_post/create_post_main.dart';
import 'package:flutter/material.dart';

import '../pages/profile_page.dart';

import 'package:photo_picker_initial/models/user.dart';
import 'package:photo_picker_initial/network/auth_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WriteSomethingWidget extends StatefulWidget {
  @override
  State<WriteSomethingWidget> createState() => _WriteSomethingWidgetState();
}

class _WriteSomethingWidgetState extends State<WriteSomethingWidget> {
  String avatar = "";
  String userID = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print(userID);
  }

  getData() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userID = prefs.getString('userID').toString();
      avatar = prefs.getString('avatar').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // background
                      elevation: 0,
                      padding: EdgeInsets.only(left: -1)),
                  child: CircleAvatar(
                    radius: 24.0,
                    // Avatar of user
                    backgroundImage: NetworkImage(avatar),
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePage(
                                userID: userID,
                              )),
                    )
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white, // background
                      foregroundColor: Colors.black,
                      elevation: 0,
                      side: BorderSide(color: Colors.grey.shade400),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreatePostMain()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(" What's on your mind?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  // onPressed: () => {
                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => CreatePostPage()),
                  // )
                  // },
                ),
                MaterialButton(
                  minWidth: 10,
                  child: Icon(
                    Icons.photo_library,
                    size: 25.0,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          //Divider(),

          /*Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.live_tv, size: 20.0, color: Colors.pink,),
                    SizedBox(width: 5.0,),
                    Text('Live', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 16.0)),
                  ],
                ),
                Container(height: 20, child: VerticalDivider(color: Colors.grey[600])),
                Row(
                  children: <Widget>[
                    Icon(Icons.photo_library, size: 20.0, color: Colors.green,),
                    SizedBox(width: 5.0),
                    Text('Photo', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 16.0)),
                  ],
                ),
                Container(height: 20, child: VerticalDivider(color: Colors.grey[600])),
                Row(
                  children: <Widget>[
                    Icon(Icons.video_call, size: 20.0, color: Colors.purple,),
                    SizedBox(width: 5.0,),
                    Text('Room', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 16.0)),
                  ],
                )
              ],
            ),
          )*/
        ],
      ),
    );
  }
}
