// ignore_for_file: unnecessary_overrides, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool employee = false;
  bool isAccepted = false;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> onSignupEmployee() async {
    Get.toNamed(Routes.RegisterEmplyee);
    employee = true;
  }

  Future<void> onSignupComapny() async {
    Get.toNamed(Routes.RegisterCompany);
    employee = false;
  }


  void goToSignInView() => Get.offNamed(Routes.SIGNIN);
}
