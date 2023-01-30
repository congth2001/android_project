import 'package:fakebook/models/list_activities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'create_post_main.dart';

class ActivitiesTab extends StatefulWidget {
  const ActivitiesTab({Key? key}) : super(key: key);

  @override
  State<ActivitiesTab> createState() => _ActivitiesTabState();
}

class _ActivitiesTabState extends State<ActivitiesTab> {
  String avatar = '';
  String name = '';
  String type = 'activity';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 4 / 1,
        ),
        children: listOfActivities
            .map(
              (item) => InkWell(
                hoverColor: Colors.white,
                onTap: () {
                  setState(() {
                    avatar = item.avatar;
                    name = item.name;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreatePostMain(
                              emoijOrActivityName: name,
                              emoijOrActivityImage: avatar,
                              emojiOrActivityType: type)));
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(item.avatar),
                          radius: 15,
                        ),
                        SizedBox(width: 10),
                        Text(item.name,
                            style: TextStyle(color: Colors.black, fontSize: 12))
                      ],
                    )),
              ),
            )
            .toList(),
      ),
    );
  }
}
