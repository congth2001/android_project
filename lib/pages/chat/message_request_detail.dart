import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/font_size.dart';

class MessageRequestDetail extends StatefulWidget {
  const MessageRequestDetail({Key? key}) : super(key: key);

  @override
  State<MessageRequestDetail> createState() => _MessageRequestDetailState();
}

class _MessageRequestDetailState extends State<MessageRequestDetail> {
  final messageController = TextEditingController();
  bool messageFocus = false;
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
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Colors.white,
          title: Row(
            children: [
              const Text('',
                  style: TextStyle(
                      color: Colors.black, fontSize: FontSize.titleSize)),
              Spacer(),
              Container(
                color: Colors.white,
                child: InkWell(
                  onTap: () {},
                  hoverColor: Colors.white,
                  child: Icon(Icons.info, size: 18, color: Colors.blue),
                ),
              ),
            ],
          )),
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(top: 30, bottom: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/andrew.jpg"))),
              ),
              Text('Andrew',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              SizedBox(height: 10),
              Text('Facebook',
                  style: TextStyle(color: Colors.black, fontSize: 12)),
              Text("You're not friends on Facebook",
                  style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              SizedBox(height: 40),
            ],
          )),
      bottomSheet: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey))),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        height: messageFocus ? 120 : 150,
        child: Column(
          children: [
            Text(
              "If you reply, Andrew will also be able to call you and see info like your Active Status and when you've read messages.",
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            if (!messageFocus)
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                        child: Text('DELETE',
                            style:
                                TextStyle(color: Colors.black, fontSize: 13)),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.grey[300])),
                  ),
                  if (!messageFocus) SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                        child: Text('BLOCK',
                            style:
                                TextStyle(color: Colors.black, fontSize: 13)),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.grey[300])),
                  )
                ],
              ),
            SizedBox(height: 5),
            SizedBox(
              height: 50,
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
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          messageFocus = hasFocus ? true : false;
                        });
                      },
                      child: TextFormField(
                        controller: messageController,
                        onChanged: (text) {
                          if (text.isNotEmpty) {
                            setState(() {
                              canSend = true;
                            });
                          } else {
                            setState(() {
                              canSend = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            hintText: 'Aa',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            suffixIcon: Icon(Icons.tag_faces,
                                color: Colors.blue, size: 18),
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  )),
                  !canSend
                      ? Icon(Icons.thumb_up, color: Colors.blue, size: 18)
                      : Icon(Icons.send, color: Colors.blue, size: 18)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
