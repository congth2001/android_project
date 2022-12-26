import 'package:flutter/material.dart';
import 'package:fakebook/models/post.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';

class PostWidget extends StatelessWidget {

  Post post;

  PostWidget({
    required this.post
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(post.profileImageUrl),
                radius: 20.0,
              ),
              SizedBox(width: 7.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(post.username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
                  SizedBox(height: 5.0),
                  Text(post.time)
                ],
              ),
            ],
          ),

          SizedBox(height: 20.0),

          Text(post.content, style: TextStyle(fontSize: 15.0)),

          SizedBox(height: 10.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(children: [
                    CircleAvatar(
                      radius: 8.0,
                      backgroundColor: Colors.blue[600],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 3, top: 2.5),
                      child: Icon(Icons.thumb_up, color: Colors.white, size: 10.0, shadows: const <Shadow>[Shadow(color: Colors.black, blurRadius: 4.0)])),
                  ]),
                  Text(' ${post.likes}'),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('${post.comments} comments  •  '),
                  Text('${post.shares} shares'),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),

          Divider(thickness: 0.5, height: 0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
                      onPressed: () {  },
                      child: Row(children: [
                        Icon(FontAwesomeIcons.message, color: Colors.black54, size: 20.0),
                        Text('  Comment', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400))
                      ],
                        mainAxisAlignment: MainAxisAlignment.center,)
                  )
                )
              ),

              Container(
                width: MediaQuery.of(context).size.width/3-10,
                height: 45,
                child: (
                    MaterialButton(
                        onPressed: () {  },
                        child: Row(children: [
                          Icon(FontAwesomeIcons.share, color: Colors.black54, size: 20.0),
                          Text('  Share', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400))
                        ],
                          mainAxisAlignment: MainAxisAlignment.center,)
                    )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
