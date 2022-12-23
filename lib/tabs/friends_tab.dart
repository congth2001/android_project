import 'package:flutter/material.dart';

class FriendsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Text('Suggestions', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                ),

                SizedBox(width: 10.0),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Text('Your Friends', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                )
              ],
            ),

            Divider(height: 40.0, thickness: 1),

            Row(
              children: <Widget>[
                Text('Friend Requests', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),

                SizedBox(width: 10.0),

                Text('8', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.red)),

                SizedBox(width: 130),

                Text('See all', style: TextStyle(fontSize: 17, color: Colors.blue[700]))
              ],
            ),

            SizedBox(height: 20.0),

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
                    Text('Chris', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Delete', style: TextStyle(color: Colors.black, fontSize: 15.0)),
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
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Delete', style: TextStyle(color: Colors.black, fontSize: 15.0)),
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
                    Text('Danny smith', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Delete', style: TextStyle(color: Colors.black, fontSize: 15.0)),
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
                    Text('Eddison', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Delete', style: TextStyle(color: Colors.black, fontSize: 15.0)),
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
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Delete', style: TextStyle(color: Colors.black, fontSize: 15.0)),
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
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Delete', style: TextStyle(color: Colors.black, fontSize: 15.0)),
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
                    Text('Kalle Jackson', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Delete', style: TextStyle(color: Colors.black, fontSize: 15.0)),
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
                    Text('Marcus Fenix', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Delete', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70.0,
              child: Row(
                children: [
                  MaterialButton(
                    elevation: 0,
                    height: 35,
                    minWidth: MediaQuery.of(context).size.width-30,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Colors.grey[300],
                    child: const Text('See all', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            Divider(height: 10.0, thickness: 1),
            SizedBox(height: 15.0),
            Text('People You May Know', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),

            SizedBox(height: 15.0),

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
                          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Add Friend', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Remove', style: TextStyle(color: Colors.black, fontSize: 15.0)),
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
                          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Add Friend', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Remove', style: TextStyle(color: Colors.black, fontSize: 15.0)),
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
                          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Add Friend', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Remove', style: TextStyle(color: Colors.black, fontSize: 15.0)),
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
                          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Adđ Friend', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Remove', style: TextStyle(color: Colors.black, fontSize: 15.0)),
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
                          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Add Friend', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Remove', style: TextStyle(color: Colors.black, fontSize: 15.0)),
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
                          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Add Friend', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Remove', style: TextStyle(color: Colors.black, fontSize: 15.0)),
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