import 'package:fakebook/tabs/home_tab.dart';
import 'package:fakebook/tabs/friends_tab.dart';
import 'package:fakebook/tabs/profile_tab.dart';
import 'package:fakebook/tabs/notifications_tab.dart';
import 'package:fakebook/tabs/menu_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
              minWidth: 5,
              color: Colors.grey[200],
              shape: const CircleBorder(),
              child: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            MaterialButton(
              minWidth: 5,
              color: Colors.grey[200],
              shape: const CircleBorder(),
              child: const Icon(Icons.message, color: Colors.black),
              onPressed: () {},
            ),
          ])
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        bottom: TabBar(
          indicatorColor: Colors.blueAccent,
          controller: _tabController,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.blueAccent,
          tabs: const [
            Tab(icon: Icon(Icons.home, size: 30.0)),
            Tab(icon: Icon(Icons.people, size: 30.0)),
            Tab(icon: Icon(Icons.account_circle, size: 30.0)),
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
          ProfileTab(),
          NotificationsTab(),
          MenuTab()
        ]
      ),
    );
  }
}