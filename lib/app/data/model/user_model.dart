// ignore_for_file: unnecessary_this

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../provider/user_firebase.dart';

class UserAccount extends GetxController {
  final String uid;
  final String username;
  final List<dynamic> selectedLanguages;
  final String email;
  late String imageUrl;
  final String phoneNumber;
  final String country;
  final String descrption;
  final String experience;
  UserAccount({
    required this.uid,
    required this.username,
    required this.imageUrl,
    required this.phoneNumber,
    required this.descrption,
    required this.selectedLanguages,
    required this.email,
    required this.country,
    required this.experience,
  });
  static UserAccount? info;

  static final Rx<UserAccount?> _currentUser = Rx<UserAccount?>(null);

  static UserAccount? get currentUser => _currentUser.value;

  static set currentUser(UserAccount? newUser) => _currentUser(newUser);

  // static Future<void> init() async {
  //   Get.put(UserAccount(email: '', country: ''));

  //   // await _bindUserChanges();
  // }

  static const String _collection = "users";
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  //UserAccount.updateViewr(widget.user.uid!);
  // static Future<void> _bindUserChanges() async {
  //   try {
  //     String? uuid = FirebaseAuth.instance.currentUser?.uid;

  //     if (uuid == null) {
  //       currentUser = null;
  //       return;
  //     }
  //     final event = await _db.collection(_collection).doc(uuid).get();
  //     currentUser = fromDoc(event);
  //   } catch (_) {
  //     FirebaseAuth.instance.signOut();
  //     rethrow;
  //   }
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uid,
      'username': username,
      'imageUrl': imageUrl,
      'phoneNumber': phoneNumber,
      'jobDescrption': descrption,
      'email': email,
      'country': country,
      'Programing Language': selectedLanguages,
      'experince': experience,
    };
  }

  factory UserAccount.formJson(Map<String, dynamic> json) {
    info = UserAccount(
        uid: json["uuid"] ?? "uuid",
        username: json['username'] ?? "UserName",
        imageUrl: json['imageUrl'] ?? "ImageUrl",
        phoneNumber: json['phoneNumber'] ?? "PhoneNumber",
        descrption: json['jobDescrption'] ?? "Dec",
        email: json['email'] ?? "Email",
        country: json['country'] ?? "Couuntry",
        selectedLanguages: json['Programing Language'] ?? ["Null"],
        experience: json['experience'] ?? "experience");
    return info!;
  }
  static void updateViewr(String thisid) async {
    try {
      DatabaseFirestore.incrementReviwed(thisid);
      // ignore: empty_catches
    } catch (e) {}
  }

  UserAccount copyWith(
      {String? uid,
      String? username,
      String? email,
      String? imageUrl,
      String? phoneNumber,
      String? descrption,
      String? country,
      String? experience,
      List<String>? selectedLanguages}) {
    return UserAccount(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      descrption: descrption ?? this.descrption,
      email: email ?? this.email,
      country: country ?? this.country,
      selectedLanguages: selectedLanguages ?? this.selectedLanguages,
      experience: experience ?? this.experience,
    );
  }

  @override
  String toString() {
    return '''UserAccount [] (
      uuid: $uid,
      username: $username,
      imageUrl: $imageUrl,
      phoneNumber: $phoneNumber,
      jobDescrption: $descrption,
      email: $email,
      countrey:$country,
    selectedlanguges:$selectedLanguages,
    experience:$experience,
    )''';
  }

  Future<void> updateCurrentUser() async {
    try {
      currentUser = this;
      await DatabaseFirestore.updateUser(userAccount: this);
      update();
    } catch (e) {
      if (kDebugMode) {
        print('error updating user account: $e');
      }
    }
  }
}
