import 'package:photo_picker_initial/models/user.dart';
import 'package:flutter/material.dart';
import 'package:photo_picker_initial/models/post.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';

import '../shared/font_size.dart';
import 'comment_widget.dart';
import '../network/auth_request.dart';

class PostWidget extends StatefulWidget {
  Post post;
  PostWidget({required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  User user = User();
  int numberOfLike = 0;

  @override
  void initState() {
    super.initState();
    List<String> likes = widget.post.like as List<String>;

    setState(() {
      numberOfLike = likes.length;
    });

    AuthRequest.getUserByID(widget.post.author.toString()).then((result) {
      setState(() {
        user = result;
      });
    });
  }

  final now = DateTime.now();

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.post.images.toString()),
                radius: 20.0,
              ),
              SizedBox(width: 7.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.username.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0)),
                  SizedBox(height: 5.0),
                  Text(DateTime.parse(widget.post.createdAt.toString())
                      .toString())
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    if (widget.post.author == 'Sam Wilson') {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuilderContext) {
                            return SizedBox(
                                height: 130,
                                child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          hoverColor: Colors.white,
                                          onTap: () {},
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.notifications_off,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Text(
                                                  'Turn off notifications for this post',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        InkWell(
                                          hoverColor: Colors.white,
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) =>
                                                    AlertDialog(
                                                        insetPadding:
                                                            EdgeInsets.symmetric(
                                                                horizontal: 16),
                                                        title: Text('Delete post?',
                                                            style: TextStyle(
                                                                fontSize: FontSize
                                                                    .titleSize,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        content: Text(
                                                            "You can edit the post if you need to make changes.",
                                                            style: TextStyle(
                                                                color: Color.fromARGB(
                                                                    255, 88, 88, 88),
                                                                fontSize: FontSize
                                                                    .contentSize)),
                                                        actions: [
                                                          TextButton(
                                                            child: Text(
                                                                'DELETE',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        FontSize
                                                                            .contentSize,
                                                                    color: Colors
                                                                        .blue)),
                                                            onPressed: () {},
                                                          ),
                                                          TextButton(
                                                            child: Text('EDIT',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        FontSize
                                                                            .contentSize,
                                                                    color: Colors
                                                                        .black)),
                                                            onPressed: () {},
                                                          ),
                                                          TextButton(
                                                            child: Text(
                                                                'CANCEL',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        FontSize
                                                                            .contentSize,
                                                                    color: Colors
                                                                        .black)),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ]));
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.delete,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Delete post',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        InkWell(
                                          hoverColor: Colors.white,
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.edit,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Edit post',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10)
                                      ],
                                    )));
                          });
                    } else {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuilderContext) {
                            return SizedBox(
                                height: 100,
                                child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          hoverColor: Colors.white,
                                          onTap: () {},
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.report,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Text('Report post',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        InkWell(
                                          hoverColor: Colors.white,
                                          onTap: () {},
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.notifications,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      'Turn on notifications for this post',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10)
                                      ],
                                    )));
                          });
                    }
                  },
                  icon: Icon(Icons.more_horiz, color: Colors.black))
            ],
          ),
          SizedBox(height: 20.0),
          Text(widget.post.described.toString(),
              style: TextStyle(fontSize: 15.0)),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(children: [
                    CircleAvatar(
                      radius: 8.0,
                      backgroundColor: Colors.blue[600],
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 3, top: 2.5),
                        child: Icon(Icons.thumb_up,
                            color: Colors.white,
                            size: 10.0,
                            shadows: const <Shadow>[
                              Shadow(color: Colors.black, blurRadius: 4.0)
                            ])),
                  ]),
                  Text(' ${numberOfLike}'),
                ],
              ),
              Row(
                children: [
                  Text('${widget.post.countComments} comments'),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(thickness: 0.5, height: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3 - 30,
                height: 45,
                child: (LikeButton(
                  size: 60.0,
                  circleColor: const CircleColor(
                      start: Color(0xff00ddff), end: Color(0xff0099cc)),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Color(0xff33b5e5),
                    dotSecondaryColor: Color(0xff0099cc),
                  ),
                  likeBuilder: (isLiked) {
                    return isLiked
                        ? Row(
                            children: [
                              Icon(Icons.thumb_up,
                                  color: Colors.blue[700], size: 20.0),
                              Text('  Like',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue[700]))
                            ],
                          )
                        : Row(children: const [
                            Icon(Icons.thumb_up_outlined,
                                color: Colors.black54, size: 20.0),
                            Text('  Like',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400))
                          ]);
                  },
                )),
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 45,
                  child: (MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CommentPage()));
                      },
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.message,
                              color: Colors.black54, size: 20.0),
                          Text('  Comment',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w400))
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      )))),
            ],
          )
        ],
      ),
    );
  }
}
