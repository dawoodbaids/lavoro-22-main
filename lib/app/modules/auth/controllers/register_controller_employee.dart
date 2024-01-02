import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavoro/app/data/repositorys/user_repository.dart';

import '../../../core/utils/helpers/custom_snack_bar.dart';
import '../../../core/utils/helpers/system_helper.dart';
import '../../../data/model/user_model.dart';
import '../../../data/provider/firebase_image.dart';
import '../../../data/provider/user_firebase.dart';
import '../../../routes/app_pages.dart';

class RegisterControllerEmployee extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  late User? user;
  late String selectedCountry = "Select Country";

  final RxBool isExpanded = false.obs;
  late String country;
  late String experience;
  late TextEditingController employeeNameController;
  late TextEditingController emailController;
  late TextEditingController descriptionController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late RxList<String> selectedLanguages = <String>[].obs;
  late String selectedExperience = "select experience";
  List<String> experiences = [
    "select experience",
    "Trainer ",
    "0-Experince ",
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

  List<String> languageOptions = [
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
  String? imagePath;
  final UserRepo = Get.put(UserRepository());

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    employeeNameController = TextEditingController();
    descriptionController = TextEditingController();
    phoneController = TextEditingController();
    country = countries[0];
    selectedLanguages = <String>[].obs;
    experience = experiences[0];
    // user = Get.arguments['user'];
    super.onInit();
  }

  Future<void> signUp() async {
    if (passwordConfirmed()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        await onContinuePressed();
      } catch (e) {
        if (kDebugMode) {
          print('Error during sign up: $e');
        }
        CustomSnackBar.error(message: e.toString());
      }
    } else {
      if (kDebugMode) {
        print('Passwords do not match');
      }
      // Handle passwords not matching, e.g., show an error.
    }
  }

  bool passwordConfirmed() {
    return passwordController.text.trim() ==
        confirmPasswordController.text.trim();
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
        username: employeeNameController.text,
        imageUrl: imageUrl!,
        phoneNumber: phoneController.text,
        descrption: descriptionController.text,
        email: emailController.text,
        country: selectedCountry,
        selectedLanguages: selectedLanguages,
        experience: selectedExperience,
      );

      await DatabaseFirestore.setUser(
          userAccount: userAccount, isCompany: false);

      UserAccount.currentUser = userAccount;

      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      CustomSnackBar.error(message: e.toString());
    }

    isLoading(true);
  }

  Future<void> createUser(UserAccount user) async {
    await UserRepo.createUser(user);
  }
}
