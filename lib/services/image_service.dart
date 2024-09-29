import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class ImageService {
  Future<String> uploadImage(File image) async {
    final storageRef = FirebaseStorage.instance.ref();
    print("Uploading image");
    final imagesRef =
        storageRef.child('images/${DateTime.now().toIso8601String()}');
    final uploadTask = imagesRef.putFile(image);

    final snapshot = await uploadTask.whenComplete(() => null);
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
