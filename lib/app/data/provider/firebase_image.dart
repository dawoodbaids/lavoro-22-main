import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseImage {
  static final FirebaseStorage _db = FirebaseStorage.instance;

  static Future<String?> uploadUserImage({
    required String imagePath,
    required String uid,
  }) async {
    log('''
    -------------------------
    | path: $imagePath,     |
    | uid: $uid,          |
    -------------------------
    ''');

    try {
    File uploadFile = File(imagePath);

    await firebase_storage.FirebaseStorage.instance
        .ref('uploads/${uploadFile.path}')
        .putFile(uploadFile);

    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('uploads/${uploadFile.path}')
        .getDownloadURL();

    return downloadURL;
    } catch (e) {
      log('Error uploading user image: $e,\n $imagePath');
      return null;
    }
  }
   
  
  

  // static Future<String> _postImages(dynamic imagefile) async {
  //   String filename = DateTime.now().millisecondsSinceEpoch.toString();

  //   if (imagefile is Asset) {
  //     await db
  //         .ref()
  //         .child("users")
  //         .child(UserAccount.currentUser!.uuid)
  //         .child('problem_images')
  //         .child(filename)
  //         .putData((await imagefile.getByteData()).buffer.asUint8List());
  //   } else if (imagefile is XFile) {
  //     await db
  //         .ref()
  //         .child("users")
  //         .child(UserAccount.currentUser!.uuid)
  //         .child('problem_images')
  //         .child(filename)
  //         .putData((await imagefile.readAsBytes()).buffer.asUint8List());
  //   } else {
  //     throw Exception(
  //         "Invalid image file type. Only Asset or XFile are supported.");
  //   }

  //   return db
  //       .ref()
  //       .child("users")
  //       .child(UserAccount.currentUser!.uuid)
  //       .child('problem_images')
  //       .child(filename)
  //       .getDownloadURL();
  // }

  // static Future<List<String>> uploadImages(List<dynamic> localImagePath) async {
  //   List<String> imageUrls = [];
  //   for (var image in localImagePath) {
  //     await _postImages(image).then((downloadUrl) {
  //       imageUrls.add(downloadUrl.toString());
  //     }).catchError((e) {
  //       log("error upload image: ${e.toString()}");
  //     });
  //   }

  //   return imageUrls;
  // }
}
