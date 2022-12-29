import 'package:flutter/material.dart';

class RequestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/chris.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Chris', style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
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
                            onPressed: () {},
                            height: 12,
                            child: Text('Confirm', style: TextStyle(
                                color: Colors.white, fontSize: 15.0)),
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
                              child: Text('Delete', style: TextStyle(
                                  color: Colors.black, fontSize: 15.0)),
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
                    Text('Adelle', style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
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
                            onPressed: () {},
                            height: 12,
                            child: Text('Confirm', style: TextStyle(
                                color: Colors.white, fontSize: 15.0)),
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
                              child: Text('Delete', style: TextStyle(
                                  color: Colors.black, fontSize: 15.0)),
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
                            onPressed: () {},
                            height: 12,
                            child: Text('Confirm', style: TextStyle(
                                color: Colors.white, fontSize: 15.0)),
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
                              child: Text('Delete', style: TextStyle(
                                  color: Colors.black, fontSize: 15.0)),
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
                            onPressed: () {},
                            height: 12,
                            child: Text('Confirm', style: TextStyle(
                                color: Colors.white, fontSize: 15.0)),
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
                              child: Text('Delete', style: TextStyle(
                                  color: Colors.black, fontSize: 15.0)),
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
                    Text('Jeremy', style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
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
                            onPressed: () {},
                            height: 12,
                            child: Text('Confirm', style: TextStyle(
                                color: Colors.white, fontSize: 15.0)),
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
                              child: Text('Delete', style: TextStyle(
                                  color: Colors.black, fontSize: 15.0)),
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
                    Text('Joey', style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
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
                            onPressed: () {},
                            height: 12,
                            child: Text('Confirm', style: TextStyle(
                                color: Colors.white, fontSize: 15.0)),
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
                              child: Text('Delete', style: TextStyle(
                                  color: Colors.black, fontSize: 15.0)),
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
                            onPressed: () {},
                            height: 12,
                            child: Text('Confirm', style: TextStyle(
                                color: Colors.white, fontSize: 15.0)),
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
                              child: Text('Delete', style: TextStyle(
                                  color: Colors.black, fontSize: 15.0)),
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
                            onPressed: () {},
                            height: 12,
                            child: Text('Confirm', style: TextStyle(
                                color: Colors.white, fontSize: 15.0)),
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
                              child: Text('Delete', style: TextStyle(
                                  color: Colors.black, fontSize: 15.0)),
                            )
                        ),
                      ],
                    )
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
