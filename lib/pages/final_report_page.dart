import 'package:flutter/material.dart';

import 'home_page.dart';

class FinalReportPage extends StatefulWidget {

  @override
  _FinalReportPage createState() => _FinalReportPage();
}

class _FinalReportPage extends State<FinalReportPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Icon(Icons.check_circle, color: Colors.green, size: 35),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Thanks for letting us know.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("We'll use this information to improve our processes. We may also use it to help us find and remove more spam.", 
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]), textAlign: TextAlign.center),
             
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
                      child: const Text('Done',
                          style: TextStyle(
                              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w500)),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                            return HomePage();
                        }));
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