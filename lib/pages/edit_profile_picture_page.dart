import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user.dart';

class EditProfilePicturePage extends StatefulWidget {
  final User user;
  EditProfilePicturePage({required this.user});
  
  @override
  _EditProfilePageState createState() => _EditProfilePageState(user: user);
}

class _EditProfilePageState extends State<EditProfilePicturePage> {
  final User user;

  _EditProfilePageState({required this.user});
  File? _image;
  final picker = ImagePicker();

  Future pickImage(ImageSource source) async {
    var pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

      } else {
        print('No image selected');
      }
    }
    
    );
    if(_image != null) {
      user.setImage(_image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'אפשרויות תמונה',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 58,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : AssetImage('./lib/images/child.png') as ImageProvider,
                    child: _image == null
                        ? Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.grey.shade600,
                          )
                        : null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          pickImage(ImageSource.gallery);
                        },
                        child: Image.asset(
                          './lib/images/gallery.png',
                          height: 54,
                        ),
                      ),

                      InkWell(
                        onTap: () {
                           pickImage(ImageSource.camera);
                        },
                        child: Image.asset(
                          './lib/images/camera.png',
                          height: 54,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
