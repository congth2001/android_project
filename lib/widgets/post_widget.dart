import 'package:fakebook/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:fakebook/models/post.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';

import '../pages/request_report_page.dart';
import '../shared/font_size.dart';
import 'comment_widget.dart';

class PostWidget extends StatelessWidget {
  Post post;

  PostWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                hoverColor: Colors.white,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage(post.profileImageUrl),
                  radius: 20.0,
                ),
              ),
              SizedBox(width: 7.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0)),
                  SizedBox(height: 5.0),
                  Text(post.time)
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    if (post.username == 'Sam Wilson') {
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
                                  )));});
                  }else{
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
                                        onTap: ()=>{
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => RequestReportPage()),
                                          )
                                        },
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
        ),

        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Text(post.content, style: TextStyle(fontSize: 15.0))
        ),

        Container(
          padding: EdgeInsets.all(10),
          child: Image.network('https://firebasestorage.googleapis.com/v0/b/social-network-app-19cd7.appspot.com/o/images%2Frn_image_picker_lib_temp_19d714d4-09ee-45a2-a1b0-c44329bcd180.jpg?alt=media&token=2ed540ab-1944-4061-b5d6-4f3ee8b598f8&fbclid=IwAR0PCicGfnvSYpF0E-dVR6bRJ40SS-NYlipPh8VQsvWHQPM7_hsh6E9aAP8', fit: BoxFit.contain, width: MediaQuery.of(context).size.width),
        ),

        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Row(
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
                  Text(' ${post.likes}'),
                ],
              ),
              Row(
                children: [
                  Text('${post.comments} comments'),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),

        Divider(thickness: 0.5, height: 0),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/3-30,
              height: 45,
              child: (
                  LikeButton(
                    size: 60.0,
                    circleColor:
                    const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    likeBuilder: (isLiked) {
                      post.likes = isLiked ? post.likes + 1 : post.likes - 1;
                      return isLiked ? Row(children: [
                        Icon( Icons.thumb_up,color: Colors.blue[700], size: 20.0),
                        Text('  Like', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.blue[700]))
                      ],) : Row(children: const [
                        Icon( Icons.thumb_up_outlined,color: Colors.black54, size: 20.0),
                        Text('  Like', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]);
                    },
                  )
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width/3,
              height: 45,
              child: (
                MaterialButton(
                    onPressed: () { 
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>CommentPage())
                      );
                     },
                    child: Row(children: [
                      Icon(FontAwesomeIcons.message, color: Colors.black54, size: 20.0),
                      Text('  Comment', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400))
                    ],
                      mainAxisAlignment: MainAxisAlignment.center,)
                )
              )
            ),

          ],
        )
      ],
    );
  }
}
