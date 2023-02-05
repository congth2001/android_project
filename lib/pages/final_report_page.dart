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

