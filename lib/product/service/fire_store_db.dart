import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FireStoreDataBase {
  String? downloadURL;

  Future getData({required String path}) async {
    try {
      await downloadURLExample(path);
      return downloadURL;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample(String path) async {
    downloadURL = await FirebaseStorage.instance
        .ref()
        .child(path)
        .getDownloadURL();
    debugPrint(downloadURL.toString());
  }
}