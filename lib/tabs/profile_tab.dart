import 'package:fakebook/widgets/separator_widget.dart';
import 'package:fakebook/widgets/what_on_your_.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 380.0,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 220.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/social-network-app-19cd7.appspot.com/o/images%2Frn_image_picker_lib_temp_19d714d4-09ee-45a2-a1b0-c44329bcd180.jpg?alt=media&token=2ed540ab-1944-4061-b5d6-4f3ee8b598f8&fbclid=IwAR0PCicGfnvSYpF0E-dVR6bRJ40SS-NYlipPh8VQsvWHQPM7_hsh6E9aAP8'), fit: BoxFit.cover),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5),
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                        ),
                        child: const CircleAvatar(
                          // backgroundImage: AssetImage('assets/Mike Tyler.jpg'),
                          backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/social-network-app-19cd7.appspot.com/o/images%2Frn_image_picker_lib_temp_19d714d4-09ee-45a2-a1b0-c44329bcd180.jpg?alt=media&token=2ed540ab-1944-4061-b5d6-4f3ee8b598f8&fbclid=IwAR0PCicGfnvSYpF0E-dVR6bRJ40SS-NYlipPh8VQsvWHQPM7_hsh6E9aAP8'),
                          radius: 80.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text('Mike Tyler', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 38.0,
                              width: MediaQuery.of(context).size.width/2 - 48,
                              decoration: BoxDecoration(
                                color: Colors.blue[700],
                                borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.post_add, color: Colors.white),
                                  Text(' Create', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 38.0,
                              width: MediaQuery.of(context).size.width/2 - 48,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.edit, color: Colors.black),
                                  Text(' Edit profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 38.0,
                              width: 46.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: Icon(Icons.more_horiz),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 15),
          SeparatorWidget(),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text('Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.home, color: Colors.grey, size: 30.0),
                    SizedBox(width: 10.0),
                    Text('Lives in New York', style: TextStyle(fontSize: 16.0))
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on, color: Colors.grey, size: 30.0),
                    SizedBox(width: 10.0),
                    Text('From New York', style: TextStyle(fontSize: 16.0))
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  children: <Widget>[
                    Icon(Icons.more_horiz, color: Colors.grey, size: 30.0),
                    SizedBox(width: 10.0),
                    Text('See your About Info', style: TextStyle(fontSize: 16.0))
                  ],
                ),

                SizedBox(height: 15.0),

                Container(
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: Colors.blue[100]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(child: Text('Edit Public Details', style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.w500, fontSize: 16.0))),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.0),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Friends', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                        SizedBox(height: 6.0),
                        Text('536 friends', style: TextStyle(fontSize: 16.0, color: Colors.grey[600])),
                      ],
                    ),
                    Text('Find Friends', style: TextStyle(fontSize: 16.0, color: Colors.blue[700])),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.width/3 -20 ,
                            width: MediaQuery.of(context).size.width/3 - 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/samantha.jpg')),
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Samantha', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.width/3 -20 ,
                            width: MediaQuery.of(context).size.width/3 - 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/andrew.jpg')),
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Andrew', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.width/3 -20 ,
                            width: MediaQuery.of(context).size.width/3 - 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/Sam Wilson.jpg'), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Sam Wilson', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.width/3 -20 ,
                            width: MediaQuery.of(context).size.width/3 - 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/steven.jpg')),
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Steven', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.width/3 -20 ,
                            width: MediaQuery.of(context).size.width/3 - 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/greg.jpg')),
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Greg', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.width/3 -20 ,
                            width: MediaQuery.of(context).size.width/3 - 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/andy.jpg'), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Andy', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 15.0),
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(child: Text('See All Friends', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16.0))),
                ),
              ],
            ),
          ),

          SeparatorWidget(),

          Container(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Posts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('Filters', style: TextStyle(color: Colors.blue[700], fontSize: 16)),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                WriteSomethingWidget(),
                Container(
                  margin: EdgeInsets.all(15),
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.newspaper, color: Colors.black),
                      Text(' Manage posts', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16.0)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SeparatorWidget(),

          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Container(
                  height: 35.0,
                  width: MediaQuery.of(context).size.width/3 - 30,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.photo_library),
                      Text(' Photos', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0)),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 35.0,
                  width: MediaQuery.of(context).size.width/3 - 30,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.account_circle),
                      Text(' Avatars', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0)),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 35.0,
                  width: MediaQuery.of(context).size.width/3 - 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.music_note),
                      Text('Music', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SeparatorWidget(),

        ],
      )
    );
  }
}