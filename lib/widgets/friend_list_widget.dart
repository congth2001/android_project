import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FriendListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/adelle.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Text('Adelle', style: TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 15.0),
                Spacer(),
                IconButton(
                  onPressed: (){
                    showModalBottomSheet(
                          context: context,
                          builder: (BuilderContext) {
                            return SizedBox(
                                height: 300,
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
                                              Icon(Icons.person,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Text("See Andrew's friends",
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
                                              Icon(FontAwesomeIcons.facebookMessenger,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      'Message Andrew',
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
                                          onTap: () {},
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.person,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "See Andrew's profile",
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
                                          onTap: () {},
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.block,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      'Block Andrew',
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
                                          onTap: () {},
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.cancel,
                                                  color: Colors.black),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      'Unfriend Andrew',
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
                  },
                  icon: Icon(Icons.more_horiz, color: Colors.black)
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/dan.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Danny smith', style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                  ],
                ),
                
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/eddison.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Eddison', style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/jeremy.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Jeremy', style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/joey.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Joey', style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/kalle.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Kalle Jackson', style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/marcus.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Marcus Fenix', style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
