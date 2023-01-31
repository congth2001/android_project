// ignore_for_file: prefer_const_constructors
import 'package:fakebook/shared/font_size.dart';
import 'package:flutter/material.dart';
import '../models/like.dart';
import '../pages/profile_page.dart';
import '../pages/search_page.dart';

class WhoLikePage extends StatefulWidget {
  const WhoLikePage({Key? key}) : super(key: key);

  @override
  State<WhoLikePage> createState() => _WhoLikePageState();
}

class _WhoLikePageState extends State<WhoLikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0.5,
            toolbarHeight: 40,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black, size: 20),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Text('People who reacted',
                style: TextStyle(color: Colors.black, fontSize: FontSize.titleSize)),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.black),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>SearchPage()
                      )
                    );
                  }
                )
              ]
            )
            ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          children: [
            ...List.generate(listOfLikePersons.length, (index) {
                var user = listOfLikePersons.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: InkWell(
                    hoverColor: Colors.white,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                    },
                    child: Row(
                      children: [
                        Stack(alignment: Alignment.bottomRight, children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  margin: const EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              user.imageUrlUser))),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                      width: 18,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                      ),
                                      child: Icon(Icons.thumb_up, color: Colors.white, size: 10)
                                      ),

                                ),
                              ]),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.nameUser, style: TextStyle(color: Colors.black, fontSize: FontSize.contentSize)),
                            SizedBox(height: 5),
                            Text(
                              '' + user.numberMutualFriends.toString() + ' mutual friends',
                              style: TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                        Spacer(),
                        if(!user.isFriend) ElevatedButton(
                          onPressed: (){
                            print('Hello');
                          },
                          child: Text('Add Friend', style: TextStyle(color: Colors.white))
                        )
                      ],
                    ),
                  ),
                );
              })
          ]
        )
        );
  }
}
