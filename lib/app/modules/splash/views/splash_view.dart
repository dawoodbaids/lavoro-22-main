import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lavoro/app/data/model/user_model.dart';
import 'package:lavoro/app/data/provider/gt_db.dart';
import 'package:lavoro/app/data/provider/user_firebase.dart';
import 'package:lavoro/app/routes/app_pages.dart';

import '../controllers/splash_controller.dart';
import '../widgets/splash_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  @override
  void initState() {
    //!.................................
    Timer(const Duration(seconds: 2), () async {
      var x = await DatabaseFirestore.getUser();

      final isUserExist = FirebaseAuth.instance.currentUser != null;
      if (Database.isFirstTime) {
        Get.toNamed(Routes.ON_BOARDING);
      } else {
        //?.........................................................
        // Get.put(DatabaseFirestore());
        if (isUserExist) {
          Get.offAndToNamed(Routes.HOME);
        } else {
          Get.offAndToNamed(Routes.SIGNIN);
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
