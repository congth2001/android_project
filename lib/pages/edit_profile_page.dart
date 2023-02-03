// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_picker_initial/shared/font_size.dart';
import 'package:flutter/material.dart';

import '../tabs/screens/select_photo_options_screen.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final descriptionController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final linkController = TextEditingController();
  final addressController = TextEditingController();

  File? _coverImage;
  File? _avatarImage;
  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    descriptionController.dispose();
    cityController.dispose();
    countryController.dispose();
    linkController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black, size: 20),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.white,
            title: Text('Edit Profile',
                style: TextStyle(
                    color: Colors.black, fontSize: FontSize.titleSize))),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Profile Picture',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      TextButton(
                          onPressed: () {
                            _showSelectPhotoOptions(context);
                          },
                          child: Text('Edit',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue)))
                    ],
                  ),
                  SizedBox(height: 10),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/Mike Tyler.jpg'),
                    radius: 60.0,
                  ),
                ])),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cover Photo',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      TextButton(
                          onPressed: () {
                            _showSelectPhotoOptions(context);
                          },
                          child: Text('Edit',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue)))
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 220.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/cover.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ])),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      SizedBox(height: 15),
                      TextField(
                        controller: descriptionController,
                        maxLength: 101,
                        minLines: 6,
                        maxLines: null,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Describe yourself...',
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.grey),
                            label: Text(
                              'You can add a short bio to tell people more about yourself. This could be anything like a favorite quote or what makes you happy.',
                              maxLines: 3,
                            )),
                      )
                    ])),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      SizedBox(height: 10),
                      TextField(
                        controller: cityController,
                        maxLength: 50,
                        maxLines: null,
                        decoration: InputDecoration(
                            hintText: 'Address',
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey),
                            labelText: 'Address'),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: addressController,
                        maxLength: 50,
                        maxLines: null,
                        decoration: InputDecoration(
                            hintText: 'City',
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey),
                            labelText: 'City'),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: countryController,
                        maxLength: 50,
                        maxLines: null,
                        decoration: InputDecoration(
                            hintText: 'Country',
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey),
                            labelText: 'Country'),
                      ),
                    ])),
            SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Link',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      SizedBox(height: 10),
                      TextField(
                        controller: linkController,
                        maxLines: null,
                        decoration: InputDecoration(
                            hintText: 'Link',
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey),
                            labelText: 'Link'),
                      ),
                    ])),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 35,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 212, 229, 245),
                        textStyle: TextStyle()),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.save, color: Colors.blue),
                        SizedBox(width: 5),
                        Text('Save',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: FontSize.contentSize)),
                      ],
                    )),
              ),
            )
          ],
        )));
  }
}
