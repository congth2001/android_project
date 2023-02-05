// ignore_for_file: prefer_const_constructors
import 'package:photo_picker_initial/shared/font_size.dart';
import 'package:flutter/material.dart';

import 'edit_profile_page.dart';

class ProfileSettingPage extends StatefulWidget {
  final bool? isMe;
  const ProfileSettingPage({Key? key, this.isMe}) : super(key: key);

  @override
  State<ProfileSettingPage> createState() => _ProfileSettingPageState();
}

class _ProfileSettingPageState extends State<ProfileSettingPage> {
  String link = "https://www.facebook.com/profile.php?id=100038272500304";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black, size: 20),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.white,
            title: Text('Profile settings',
                style: TextStyle(
                    color: Colors.black, fontSize: FontSize.titleSize))),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(height: 10, color: Colors.grey[300]),
            (widget.isMe != null && widget.isMe == true)
                ? Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage()));
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.mode_edit,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text('Edit profile',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black))
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.block,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text('Block',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black))
                        ],
                      ),
                    ),
                  ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text('Search',
                        style: TextStyle(fontSize: 14, color: Colors.black))
                  ],
                ),
              ),
            ),
            if (widget.isMe != null && widget.isMe == true)
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text('View as',
                          style: TextStyle(fontSize: 14, color: Colors.black))
                    ],
                  ),
                ),
              ),
            if (widget.isMe != null && widget.isMe == true)
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.archive,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text('Archive',
                          style: TextStyle(fontSize: 14, color: Colors.black))
                    ],
                  ),
                ),
              ),
            if (widget.isMe != null && widget.isMe == true)
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.insert_drive_file,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text('Manage posts',
                          style: TextStyle(fontSize: 14, color: Colors.black))
                    ],
                  ),
                ),
              ),
            if (widget.isMe != null && widget.isMe == true)
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.business_center,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text('Privacy Center',
                          style: TextStyle(fontSize: 14, color: Colors.black))
                    ],
                  ),
                ),
              ),
            Container(height: 10, color: Colors.grey[300]),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ((widget.isMe != null && widget.isMe == true)
                              ? 'Your'
                              : "Andrew's") +
                          ' profile link',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 5),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        ((widget.isMe != null && widget.isMe == true)
                                ? 'Your'
                                : "Andrew's") +
                            " personalized link on Facebook.",
                        style:
                            TextStyle(color: Colors.grey[500], fontSize: 16))),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(link,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          textStyle: TextStyle()),
                      onPressed: () {},
                      child: Text('Copy link',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: FontSize.contentSize))),
                )
              ]),
            )
          ],
        )));
  }
}
