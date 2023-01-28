import 'package:flutter/material.dart';

class CreatePostPage extends StatefulWidget {

  @override
  _CreatePostPage createState() => _CreatePostPage();
}

class _CreatePostPage extends State<CreatePostPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text('Create post', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: () {},
              child: Text('Post'),
            )
          ], 
        ),
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // background
            foregroundColor: Colors.black,
            elevation: 0,
            shape: const CircleBorder(),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
          onPressed: () => {
            Navigator.pop(context)
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/Mike Tyler.jpg'),
                ),
                title: Text("Mike Tyler"),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.grey),
                          onPressed: () {},
                          icon: Icon(Icons.group),
                          label: Row(
                            children: [
                              Text('Friends'),
                              Expanded(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.grey),
                          onPressed: () {},
                          icon: Icon(Icons.add),
                          label: Row(
                            children: [
                              Text('Album'),
                              Expanded(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 30,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'What\'s on your Mind?',
                  hintStyle: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}