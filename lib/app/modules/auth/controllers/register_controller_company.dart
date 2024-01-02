// ignore_for_file: avoid_print

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../core/utils/helpers/custom_snack_bar.dart';
import '../../../core/utils/helpers/system_helper.dart';
import '../../../data/model/user_model.dart';
import '../../../data/provider/firebase_image.dart';
import '../../../data/provider/user_firebase.dart';
import '../../../data/repositorys/user_repository.dart';
import '../../../routes/app_pages.dart';

class RegisterControllerCompany extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User? user;
  late String selectedCountry2 = "Select Country";
  late RxBool isExpanded = false.obs;
  late String experience;
  late String? imagePath;
  late String country;
  late TextEditingController companyNameController;
  late TextEditingController cemailController;
  late TextEditingController jobDescriptionController;
  late TextEditingController cphoneController;
  late TextEditingController cpasswordController;
  late TextEditingController cconfirmPasswordController;
  late RxList<String> cselectedLanguages = <String>[].obs;

  late String selectedExperience = "select experience";
  List<String> experiences = [
    "select experience",
    "0-Experince",
    "1-5 years",
    "5-10  years",
    "10-15",
    "15 OR more",
  ];
  List<String> countries = [
    "Select Country",
    "irbid",
    "aqaba",
    "zarqa",
    "amman",
    "ma'an",
    "balqa",
    "maraq",
    "tafilah",
    "madaba",
    "jerash",
    "ajloun",
    "karak"
  ];

List<String> languageOptions= [
    'Python',
    'Java',
    'JavaScript',
    'C#',
    'C++',
    'Ruby',
    'PHP',
    'Swift',
    'Kotlin',
    'Dart',
    'Go',
    'Rust',
    'TypeScript',
    'SQL',
    'HTML/CSS',
    'Perl',
    'Scala',
    'Objective-C',
    'Lua',
    'Haskell',
    'COBOL',
    'Fortran',
    'Prolog'
  ];
 final UserRepo = Get.put(UserRepository());
  @override
  void onInit() {
    cemailController = TextEditingController();
    cpasswordController = TextEditingController();
    cconfirmPasswordController = TextEditingController();
    companyNameController = TextEditingController();
    jobDescriptionController = TextEditingController();
    cphoneController = TextEditingController();
    country = countries[0];
    cselectedLanguages = <String>[].obs;
    experience = experiences[0];
    super.onInit();
  }

  Future<void> signUp() async {
    if (passwordConfirmed()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: cemailController.text.trim(),
          password: cpasswordController.text.trim(),
        );
        await onContinuePressed();

        Get.offAllNamed(Routes.HOME);
      } catch (e) {
        print('Error during sign up: $e');
        CustomSnackBar.error(message: e.toString());
      }
    } else {
      print('Passwords do not match');
      // Handle passwords not matching, e.g., show an error.
    }
  }

  bool passwordConfirmed() {
    return cpasswordController.text.trim() ==
        cconfirmPasswordController.text.trim();
  }

  static User? get userInfo {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> onContinuePressed() async {
    SystemHelper.closeKeyboard();
    final isValidForm = formKey.currentState!.validate();
    if (isValidForm == false) return;
    if (imagePath == null || imagePath!.isEmpty) {
      CustomSnackBar.warning(
        title: "Profile picture",
        message: "Please select a profile picture",
      );
      return;
    }

    isLoading(true);

    try {
      var uid = userInfo?.uid;
      final imageUrl = await FirebaseImage.uploadUserImage(
        imagePath: imagePath!,
        uid: uid!,
      );

      UserAccount userAccount = UserAccount(
        uid: uid,
        username: companyNameController.text,
        imageUrl: imageUrl!,
        phoneNumber: cphoneController.text,
        descrption: jobDescriptionController.text,
        email: cemailController.text,
        country: selectedCountry2,
        selectedLanguages: cselectedLanguages,
        experience: selectedExperience,
      );

      await DatabaseFirestore.setUser(
          userAccount: userAccount, isCompany: true);

      UserAccount.currentUser = userAccount;

      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      CustomSnackBar.error(message: e.toString());
    }

    isLoading(false);
  }
Future<void> createUser(UserAccount company) async {
    await UserRepo.createUser(company);
  }
  //Future<UserAccount?> getUser() async {
  // try {
  // final paths =
  //     await _firestore.collection("users").doc(userInfo?.uid).get();
  // Map<String, dynamic> data = paths.data() ?? {};
//
  // if (!completer.isCompleted) {
  //   completer.complete(UserAccount.formJson(data));
}
      // } on FirebaseException catch (e) {
      //   if (!completer.isCompleted) {qضq
      //     showDialog(
      //       context: Get.overlayContext!,
      //       builder: (BuildContext context) {
      //         return AlertDialog(
      //           title: Text('Firebase Exception'),
      //           content: Text(e.message.toString()),
      //         );
      //       },
      //     );
      //   }
  //  } catch (e) {
     // if (!completer.isCompleted) {
   //     print('salah ');
        //Get.offAll(() => const NoInternetView());
  ///  /  }
    //}

   // return completer.future;
 /// }
 // }
 //  static User? get userInfo {
   // return FirebaseAuth.instance.currentUser;
// // }
//}
