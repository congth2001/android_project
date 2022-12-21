import 'package:fakebook/widgets/write_something_widget.dart';
import 'package:fakebook/widgets/separator_widget.dart';
import 'package:fakebook/widgets/post_widget.dart';
import 'package:fakebook/widgets/stories_widget.dart';
import 'package:fakebook/widgets/online_widget.dart';
import 'package:fakebook/models/post.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

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
          for(Post post in posts) Column(
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