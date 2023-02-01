import 'package:photo_picker_initial/widgets/separator_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTab extends StatefulWidget {
  @override
  _WatchTabState createState() => _WatchTabState();
}

class _WatchTabState extends State<WatchTab> {
  // String videoUrl1 = 'https://www.youtube.com/watch?v=v1ADEPnPt54';
  String videoUrl1 = 'v1ADEPnPt54';
  late YoutubePlayerController _controller1;

  // String videoUrl2 = 'https://www.youtube.com/watch?v=E1ZVSFfCk9g';
  String videoUrl2 = 'E1ZVSFfCk9g';
  late YoutubePlayerController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = YoutubePlayerController(
      initialVideoId: videoUrl1,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _controller2 = YoutubePlayerController(
      initialVideoId: videoUrl2,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
              child: Text('Watch',
                  style:
                      TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 60.0,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 15.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.grey[300]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.videocam, size: 20.0),
                        SizedBox(width: 5.0),
                        Text('Live',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.grey[300]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.music_note, size: 20.0),
                        SizedBox(width: 5.0),
                        Text('Music',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.grey[300]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.check_box, size: 20.0),
                        SizedBox(width: 5.0),
                        Text('Following',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.grey[300]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.fastfood, size: 20.0),
                        SizedBox(width: 5.0),
                        Text('Food',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.grey[300]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.gamepad, size: 20.0),
                        SizedBox(width: 5.0),
                        Text('Gaming',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(width: 15.0),
                ],
              ),
            ),
            SeparatorWidget(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/greg.jpg'),
                        radius: 20.0,
                      ),
                      SizedBox(width: 7.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Greg',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0)),
                          SizedBox(height: 5.0),
                          Text('7h')
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.0),

                // YoutubePlayer(controller: _controller1),

                YoutubePlayer(controller: _controller1),

                SizedBox(height: 10.0),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                                      Shadow(
                                          color: Colors.black, blurRadius: 4.0)
                                    ])),
                          ]),
                          Text(' 23'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('2 comments  •  '),
                          Text('1 share'),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(thickness: 0.5, height: 0),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
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
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(FontAwesomeIcons.message,
                                    color: Colors.black54, size: 20.0),
                                Text('  Comment',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400))
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            )))),
                    Container(
                      width: MediaQuery.of(context).size.width / 3 - 10,
                      height: 45,
                      child: (MaterialButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.share,
                                  color: Colors.black54, size: 20.0),
                              Text('  Share',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400))
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ))),
                    ),
                  ],
                )
              ],
            ),
            SeparatorWidget(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/olivia.jpg'),
                        radius: 20.0,
                      ),
                      SizedBox(width: 7.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Olivia',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0)),
                          SizedBox(height: 5.0),
                          Text('10h')
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                YoutubePlayer(controller: _controller2),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                                      Shadow(
                                          color: Colors.black, blurRadius: 4.0)
                                    ])),
                          ]),
                          Text(' 98'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('12 comments  •  '),
                          Text('6 shares'),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(thickness: 0.5, height: 0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
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
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(FontAwesomeIcons.message,
                                    color: Colors.black54, size: 20.0),
                                Text('  Comment',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400))
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            )))),
                    Container(
                      width: MediaQuery.of(context).size.width / 3 - 10,
                      height: 45,
                      child: (MaterialButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.share,
                                  color: Colors.black54, size: 20.0),
                              Text('  Share',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400))
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ))),
                    ),
                  ],
                )
              ],
            ),
            SeparatorWidget(),
          ],
        )),
      ),
    );
  }
}
