import 'package:photo_picker_initial/pages/create_post/activities_tab.dart';
import 'package:photo_picker_initial/pages/create_post/create_post_main.dart';
import 'package:photo_picker_initial/pages/create_post/feelings_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/font_size.dart';

class FeelingsAndActivities extends StatefulWidget {
  final String? avatar;
  final String? name;
  final String? type;
  const FeelingsAndActivities({Key? key, this.avatar, this.name, this.type})
      : super(key: key);

  @override
  State<FeelingsAndActivities> createState() => _FeelingsAndActivitiesState();
}

class _FeelingsAndActivitiesState extends State<FeelingsAndActivities>
    with SingleTickerProviderStateMixin {
  String title = '';
  late TabController controller;
  bool hasEmojiOrActivitySelected = false;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
    if (widget.avatar != null && widget.name != '') {
      setState(() {
        hasEmojiOrActivitySelected = true;
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 100,
              backgroundColor: Colors.white,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back,
                              color: Colors.black, size: 20),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CreatePostMain(
                                            emoijOrActivityImage:
                                                widget.avatar ?? '',
                                            emoijOrActivityName:
                                                widget.name ?? '',
                                            emojiOrActivityType:
                                                widget.type ?? '')),
                                (route) => false);
                          }),
                      Text(
                          controller.index == 0
                              ? 'How are you feeling?'
                              : 'What are you doing?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: FontSize.titleSize)),
                    ],
                  ),
                  TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.blue,
                    labelStyle: TextStyle(fontSize: 12),
                    controller: controller,
                    tabs: [Tab(text: 'FEELINGS'), Tab(text: 'ACTIVITIES')],
                  )
                ],
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(40),
                  child: !hasEmojiOrActivitySelected
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                  top: BorderSide(color: Colors.grey),
                                  bottom: BorderSide(color: Colors.grey))),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.grey),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (widget.avatar != '')
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(widget.avatar ?? ''),
                                  radius: 15,
                                ),
                              SizedBox(width: 10),
                              Text(widget.name ?? '',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12)),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.clear, color: Colors.grey),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              CreatePostMain(
                                                emoijOrActivityImage: '',
                                                emoijOrActivityName: '',
                                                emojiOrActivityType: '',
                                              )),
                                      (route) => false);
                                },
                              )
                            ],
                          )))),
          body: TabBarView(
            controller: controller,
            children: [FeelingsTab(), ActivitiesTab()],
          )),
    );
  }
}
