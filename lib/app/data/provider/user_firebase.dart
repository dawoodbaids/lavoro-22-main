import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/chatuser_db.dart';
import '../model/user_model.dart';

class DatabaseFirestore extends GetxController {
  static const String _collection = "users";
  static const String _collectionCom = "company";
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;
  static User? get userInfo {
    return FirebaseAuth.instance.currentUser;
  }

  static Future<UserAccount?> getUser() async {
    try {
      var uid = userInfo?.uid;
      final paths = await firebaseInstance.collection("users").doc(uid).get();
      Map<String, dynamic> data = paths.data() ?? {};
      var userAccount = UserAccount.formJson(data);
      // if (userAccount.uid == "uuid") {
      //   final paths =
      //       await firebaseInstance.collection("company").doc(uid).get();
      //   Map<String, dynamic> data = paths.data() ?? {};
      //   userAccount = UserAccount.formJson(data);
      //   final company = await firebaseInstance
      //       .collection("company")
      //       .where('Programing Language', )
      //       .get();
      //   List<UserAccount> companyinhome = [];
      //   try {
      //     company.docs.forEach((doc) {
      //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      //       companyinhome.add(UserAccount.formJson(data));
      //       print(company);
      //     });
      //   } catch (e) {
      //     print(e);
      //   }
      // }

      return userAccount;
    } on FirebaseException catch (e) {
      showDialog(
        context: Get.overlayContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Firebase Exception'),
            content: Text(e.message.toString()),
          );
        },
      );
      return null; // or throw e; depending on how you want to handle this case
    }
  }

  static Future<void> setUser(
      {required UserAccount userAccount, required bool isCompany}) async {
    try {
      await _db
          .collection(isCompany ? _collectionCom : _collection)
          .doc(userAccount.uid)
          .set(userAccount.toMap());
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e);
      }

      rethrow;
    }
  }

  static Future<void> updateUser({required UserAccount userAccount}) async {
    try {
      await _db
          .collection(_collection)
          .doc(userInfo?.uid)
          .update(userAccount.toMap());
    } on FirebaseException catch (_) {
      rethrow;
    }
  }

  static incrementReviwed(String thisuid) async {
    try {
      if (kDebugMode) {
        print("done");
      }
      await firebaseInstance.collection('users').doc(thisuid).update({
        "reviewd": FieldValue.arrayUnion([userInfo!.uid])
      });
    } catch (e) {
      if (kDebugMode) {
        print(thisuid);
      }
      if (kDebugMode) {
        print('Error updating document: $e');
      }
    }
  }

  static Future<String?> uploadUserImage({
    required String imagePath,
    required String uuid,
  }) async {
    log('''
    -------------------------
    | path: $imagePath,     |
    | uuid: $uuid,          |
    -------------------------
    ''');

    try {
      File uploadFile = File(imagePath);

      final TaskSnapshot uploadTask = await FirebaseStorage.instance
          .ref('users/$uuid/profile_image')
          .putFile(uploadFile);

      final String downloadUrl = await uploadTask.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      log('Error uploading user image: $e,\n $imagePath');
      return null;
    }
  }

  static Stream<UserAccountChat> getUserByIdStream(String id) {
    return firebaseInstance.collection("users").doc(id).snapshots().map((doc) {
      final data = doc.data() ?? {};

      return UserAccountChat.formJson(data);
    });
  }

  static Future<UserAccountChat?> getUserById(String id) async {
    try {
      final doc = await firebaseInstance.collection("users").doc(id).get();
      final data = doc.data() ?? {};
      final userAccountChat = UserAccountChat.formJson(data);
      if (userAccountChat.uid == null) {
        return null;
      }
      return userAccountChat;
    } catch (err) {
      rethrow;
    }
  }
}
