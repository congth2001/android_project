import 'package:photo_picker_initial/models/list_feelings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'create_post_main.dart';

class FeelingsTab extends StatefulWidget {
  const FeelingsTab({Key? key}) : super(key: key);

  @override
  State<FeelingsTab> createState() => _FeelingsTabState();
}

class _FeelingsTabState extends State<FeelingsTab> {
  String avatar = '';
  String name = '';
  String type = 'emoji';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 4 / 1,
        ),
        children: listOfFeelings
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
