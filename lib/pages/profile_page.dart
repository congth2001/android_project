import 'package:fakebook/tabs/screens/profile_tab.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[100], // background
            foregroundColor: Colors.black,
            elevation: 0,
            shape: const StadiumBorder(),
          ),
          child: Row(children: [
            Icon(Icons.search, color: Colors.grey[500]),
            Text(' Search',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                )),
          ]),
          onPressed: () => {},
        ),
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // background
            foregroundColor: Colors.black,
            elevation: 0,
            shape: const CircleBorder(),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
          onPressed: () => {Navigator.pop(context)},
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ProfileTab(),
    );
  }
}
