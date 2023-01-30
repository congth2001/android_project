import 'package:flutter/material.dart';

import 'final_report_page.dart';

class RequestReportPage extends StatefulWidget {

  @override
  _RequestReportPage createState() => _RequestReportPage();
}

class _RequestReportPage extends State<RequestReportPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 10),
            
            Text("Report",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              )
            ),
            
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.grey[800],
                size: 25,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Report something that doesn't look right", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("If someone is in immediate danger, get help before reporting to Facebook. Don't wait.", 
                    style: TextStyle(fontSize: 16, color: Colors.grey[700])),
              SizedBox(height: 18),
              
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(child: Icon(Icons.find_in_page)),
                    TextSpan(text: "    You can submit a report now even if you don't add information.", style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(child: Icon(Icons.add_to_photos)),
                    TextSpan(text: "    Or add information to help us understand what's wrong", style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(child: Icon(Icons.privacy_tip)),
                    TextSpan(text: "    We won't let know who reported them.", style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              SizedBox(height: 10),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 70.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      elevation: 0,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minWidth: MediaQuery.of(context).size.width - 30,
                      color: Colors.blue[700],
                      child: const Text('Submit report',
                          style: TextStyle(
                              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w500)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinalReportPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
        )
      )
    );
  }
}