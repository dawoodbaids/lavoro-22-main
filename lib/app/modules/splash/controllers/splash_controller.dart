import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/model/user_model.dart';
import '../../../data/provider/local_database.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    check();
  }

  Future<void> check() async {
    final isLogin = FirebaseAuth.instance.currentUser != null;

    LocalDatabase.isFirstTime.printInfo(info: "isFirstTime ");
    if (LocalDatabase.isFirstTime) {
      await Future.delayed(1.seconds);
      Get.toNamed(Routes.ON_BOARDING);
    } else {
      if (isLogin) {
        // await UserAccount.init();

        // if (UserAccount.currentUser == null) {
        //   final user = FirebaseAuth.instance.currentUser!;
        //   Get.offAndToNamed(Routes.REGISTER, arguments: {'user': user});
        // } else {
        Get.offAndToNamed(Routes.HOME);
        // }
      } else {
        await Future.delayed(1.seconds);
        Get.offAndToNamed(Routes.SIGNIN);
      }
    }
  }
}
