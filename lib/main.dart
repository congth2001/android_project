import 'package:photo_picker_initial/pages/create_post/create_post_main.dart';
import 'package:photo_picker_initial/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:photo_picker_initial/pages/changePassword/changePasword.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'facebook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}
