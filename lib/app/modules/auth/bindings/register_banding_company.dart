import 'package:get/get.dart';
import 'package:lavoro/app/modules/auth/controllers/register_controller_Company.dart';

class RegisterBindingCompany extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterControllerCompany>(
      () => RegisterControllerCompany(),
    );
  }
}
