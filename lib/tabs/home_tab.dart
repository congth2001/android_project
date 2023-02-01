import 'package:photo_picker_initial/widgets/what_on_your_.dart';
import 'package:photo_picker_initial/widgets/separator_widget.dart';
import 'package:photo_picker_initial/widgets/post_widget.dart';
import 'package:photo_picker_initial/widgets/stories_widget.dart';
import 'package:photo_picker_initial/models/post.dart';
import 'package:flutter/material.dart';

import '../network/post_request.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<Post> posts = List<Post>.empty();

  @override
  void initState() {
    super.initState();
    PostRequest.getAllPost().then((postList) {
      setState(() {
        posts = postList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          WriteSomethingWidget(),
          SeparatorWidget(),
          //OnlineWidget(),
          //SeparatorWidget(),
          StoriesWidget(),
          for (Post post in posts)
            Column(
              children: <Widget>[
                SeparatorWidget(),
                PostWidget(post: post),
              ],
            ),
          SeparatorWidget(),
        ],
      ),
    );
  }
}
