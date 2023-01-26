import 'package:fakebook/pages/search_page.dart';
import 'package:fakebook/tabs/home_tab.dart';
import 'package:fakebook/tabs/notifications_tab.dart';
import 'package:fakebook/tabs/menu_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../tabs/friends_tab.dart';
import '../tabs/watch_tab.dart';
import 'chat/chat_main_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: false,
        title: Transform(
          transform:  Matrix4.translationValues(10.0, 0.0, 0.0),
          child: Row(children: [
            Text('facebook', style: TextStyle(color: Colors.blueAccent[400], fontSize: 27.0, fontWeight: FontWeight.bold)),
            const SizedBox(width: 165),
            MaterialButton(
              elevation: 0,
              minWidth: 5,
              color: Colors.grey[200],
              shape: const CircleBorder(),
              child: const Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.black, size: 20),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                )
              },
            ),
            MaterialButton(
              elevation: 0,
              minWidth: 5,
              color: Colors.grey[200],
              shape: const CircleBorder(),
              child: const Icon(FontAwesomeIcons.facebookMessenger, color: Colors.black, size: 22),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatMainPage()),
                );
              },
            ),
          ])
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        bottom: TabBar(
          indicatorColor: Colors.blueAccent,
          controller: _tabController,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.blueAccent,
          tabs: const [
            Tab(icon: Icon(Icons.home, size: 30.0)),
            Tab(icon: Icon(Icons.group, size: 30.0)),
            Tab(icon: Icon(Icons.ondemand_video, size: 30.0)),
            Tab(icon: Icon(Icons.notifications, size: 30.0)),
            Tab(icon: Icon(Icons.menu, size: 30.0))
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeTab(),
          FriendsTab(),
          WatchTab(),
          NotificationsTab(),
          MenuTab()
        ]
      ),
    );
  }
}