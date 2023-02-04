import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:like_button/like_button.dart';
import 'who_like.dart';
import '../pages/profile_page.dart';

import '../models/comment.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  String postID;
  CommentPage({required this.postID});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final commentController = TextEditingController();
  bool canSend = false;
  List<Comment> commentList = List<Comment>.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 40,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                  hoverColor: Colors.white,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WhoLikePage()));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.thumb_up, color: Colors.blue, size: 20),
                      SizedBox(width: 5),
                      Text('190',
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                      Icon(Icons.keyboard_arrow_right, color: Colors.black)
                    ],
                  )),
              Spacer(),
              LikeButton(
                size: 60.0,
                circleColor: const CircleColor(
                    start: Color(0xff00ddff), end: Color(0xff0099cc)),
                bubblesColor: const BubblesColor(
                  dotPrimaryColor: Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
                likeBuilder: (isLiked) {
                  return isLiked
                      ? Icon(Icons.thumb_up,
                          color: Colors.blue[700], size: 20.0)
                      : Icon(Icons.thumb_up_outlined,
                          color: Colors.black54, size: 20.0);
                },
              )
            ],
          )),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
                onPressed: () {},
                child: Text('See previous comments...',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.left)),
          ),
          ...List.generate(commentList.length, (index) {
            var comment = commentList.elementAt(index);
            return Row(
              children: [
                InkWell(
                    hoverColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage('ok.jpg'))),
                    )),
                SizedBox(width: 10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 10, bottom: 5, right: 80),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Text(comment.comment.toString(),
                            style:
                                TextStyle(color: Colors.black, fontSize: 12))),
                    Text(comment.created.toString(),
                        style:
                            TextStyle(color: Colors.grey[400], fontSize: 10)),
                  ],
                ))
              ],
            );
          }),
          SizedBox(height: 50),
        ],
      ),
      bottomSheet: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 30,
                padding: const EdgeInsets.only(left: 10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: TextFormField(
                  controller: commentController,
                  onChanged: (text) {
                    if (text.isNotEmpty) {
                      setState(() {
                        canSend = true;
                      });
                    } else {
                      setState(() {
                        canSend = false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintText: 'Write a comment...',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      suffixIcon:
                          Icon(Icons.tag_faces, color: Colors.blue, size: 18),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              )),
              canSend
                  ? IconButton(
                      icon: Icon(Icons.send, color: Colors.blue, size: 18),
                      onPressed: () {},
                    )
                  : Icon(Icons.send, color: Colors.grey, size: 18)
            ],
          )),
    );
  }
}
