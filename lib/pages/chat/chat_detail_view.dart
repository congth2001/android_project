import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../models/message.dart';
import '../../shared/font_size.dart';

class ChatDetailView extends StatefulWidget {
  
  const ChatDetailView({Key? key}) : super(key: key);

  @override
  State<ChatDetailView> createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {
  final messageController = TextEditingController();
  bool canSend = false;

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blue, size: 18),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/andrew.jpg'))),
            ),
            SizedBox(width: 10),
            Text('Andrew',
                style: TextStyle(
                    color: Colors.black, fontSize: FontSize.contentSize)),
            const Spacer(),
            Container(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                hoverColor: Colors.white,
                child: Icon(Icons.call, size: 18, color: Colors.blue),
              ),
            ),
            SizedBox(width: 5),
            Container(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                hoverColor: Colors.white,
                child: Icon(Icons.videocam, size: 18, color: Colors.blue),
              ),
            ),
            SizedBox(width: 5),
            Container(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                hoverColor: Colors.white,
                child: Icon(Icons.info, size: 18, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        children: List.generate(conversation.length, (index) {
          var message = conversation.elementAt(index);
          if (message.my_account != true) {
            return Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/andrew.jpg'))),
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('15:29', style: TextStyle(color: Colors.grey[400], fontSize: 10)),
                        Container(
                            margin: EdgeInsets.only(top: 5, bottom: 10, right: 80),
                            padding:
                                EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Text(message.message,
                                style:
                                    TextStyle(color: Colors.black, fontSize: 12))),
                      ],
                    ))
              ],
            );
          } else {
            return Row(
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('15:29', style: TextStyle(color: Colors.grey[400], fontSize: 10)),
                        Container(
                            margin: EdgeInsets.only(top: 5, bottom: 10, left: 80),
                            padding:
                                EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Text(message.message,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 12))),
                      ],
                    )),
                if (!message.seen) SizedBox(width: 5),
                if (!message.seen)
                  Icon(Icons.check_circle, size: 15, color: Colors.grey[500])
              ],
            );
          }
        }),
      ),
      bottomSheet: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 30,
                padding: const EdgeInsets.only(left: 10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: TextFormField(
                  controller: messageController,
                  onChanged: (text){
                    if(text.isNotEmpty) {
                      setState((){
                        canSend = true;
                      });
                    }else{
                      setState((){
                        canSend = false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintText: 'Aa',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      suffixIcon:
                          Icon(Icons.tag_faces, color: Colors.blue, size: 18),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              )),
              !canSend ? Icon(Icons.thumb_up, color: Colors.blue, size: 18) : Icon(Icons.send, color: Colors.blue, size: 18)
            ],
          )),
    );
  }
}
