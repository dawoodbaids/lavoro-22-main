import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavoro/app/data/model/user_model.dart';

import '../../../core/utils/helpers/custom_snack_bar.dart';
import '../../../core/utils/helpers/system_helper.dart';
import '../../../data/provider/user_firebase.dart';
import '../../../data/repositorys/auth_repository.dart';
import '../../../routes/app_pages.dart';

class SigninController extends GetxController {
  // final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  Future<bool> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      
      await DatabaseFirestore.getUser();

      Get.offAllNamed(Routes.HOME);

      return true;
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Error Occurred During Login Please Try Again Later';

      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'Invalid Email Address Please Enter A Valid Email';
          break;
        case 'user-disabled':
          errorMessage = 'This user account has been disabled';
          break;
        case 'user-not-found':
 errorMessage = 'user-not-found';
          break;    
        case 'wrong-password':
          errorMessage = 'invalid Eail Or Password Please Check Your Credentials';
          break;
        default:
     errorMessage = 'Error: ${e.message}';
      }

      Get.snackbar(
        "About Login".tr,
        "Login Message".tr,
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          'Login Failed'.tr,
          style: const TextStyle(color: Colors.white),
        ),
        messageText: Text(
          errorMessage,
          style: const TextStyle(color: Colors.white),
        ),
      );

      return false;
    }
  }

  void goToSignUpView() => Get.toNamed(Routes.SIGNUP);
}
