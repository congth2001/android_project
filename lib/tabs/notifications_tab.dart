import 'package:flutter/material.dart';
import 'package:fakebook/widgets/notification_widget.dart';
import 'package:fakebook/models/user_notification.dart';
class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, .0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Text('Notifications', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.grey[300],
                      shape: const CircleBorder(),
                      child: const Icon(Icons.search, color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Friend requests', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Positioned(child:
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text('See All', style: TextStyle(color: Colors.blue[800])),
                  )
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
            child: Row(
              children: [
                Stack(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 33.0,
                      backgroundImage: AssetImage('assets/Sam Wilson.jpg'),
                    ),
                    const Positioned(
                      bottom: -1,
                      right: -1,
                      child: CircleAvatar(
                        radius: 13.0,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: -1,
                      right: -1,
                      child: Icon(Icons.account_circle, color: Colors.lightBlue[700], size: 30.0, shadows: const <Shadow>[Shadow(color: Colors.black, blurRadius: 4.0)])
                    ),
                  ],
                ),

                SizedBox(width: 20.0),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Column(children:[
                          Row(children: const [
                            Text('Chris ', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800)),
                            Text('sent you a friend request.', style: TextStyle(fontSize: 16)),
                          ],),],
                        ),
                        Column(children: [
                            Row(children: const [
                              Text('       '),
                              Icon(Icons.more_horiz),
                            ],),],
                        ),
                      ],
                    ),
                    const Text('3 hours ago', style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                    const SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
                          width: 138.0,
                          decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
                          width: 138.0,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: const Text('Delete', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),

          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Earlier', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          for(UserNotification notification in notifications) NotificationWidget(notification: notification),
        ],
      ),
    );
  }
}