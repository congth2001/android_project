import 'package:flutter/material.dart';


class SuggestionWidget extends StatelessWidget {
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
                  backgroundImage: AssetImage('assets/mathew.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Mathew', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 35,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: MaterialButton(
                            onPressed: () {  },
                            height: 12,
                            child: Text('Add Friend', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                            height: 35,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: MaterialButton(
                              onPressed: () {  },
                              child: Text('Remove', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                            )
                        ),
                      ],
                    )
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
                    Text('Joey', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 35,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: MaterialButton(
                            onPressed: () {  },
                            height: 12,
                            child: Text('Add Friend', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                            height: 35,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: MaterialButton(
                              onPressed: () {  },
                              child: Text('Remove', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                            )
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/adelle.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Adelle', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 35,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: MaterialButton(
                            onPressed: () {  },
                            height: 12,
                            child: Text('Add Friend', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                            height: 35,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: MaterialButton(
                              onPressed: () {  },
                              child: Text('Remove', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                            )
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/timothy.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Timothy', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 35,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: MaterialButton(
                            onPressed: () {  },
                            height: 12,
                            child: Text('Add Friend', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                            height: 35,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: MaterialButton(
                              onPressed: () {  },
                              child: Text('Remove', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                            )
                        ),
                      ],
                    )
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
                    Text('Jeremy', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 35,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: MaterialButton(
                            onPressed: () {  },
                            height: 12,
                            child: Text('Add Friend', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                            height: 35,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: MaterialButton(
                              onPressed: () {  },
                              child: Text('Remove', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                            )
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/tanya.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Tanya', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 35,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: MaterialButton(
                            onPressed: () {  },
                            height: 12,
                            child: Text('Add Friend', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                            height: 35,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text('Remove', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                            )
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20.0)
          ],
        )
      ),
    );
  }
}