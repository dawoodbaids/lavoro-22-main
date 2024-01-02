import 'package:get/get.dart';

import '../controllers/register_controller_employee.dart';

class RegisterBindingEmployee extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterControllerEmployee>(
      () => RegisterControllerEmployee(),
    );
  }
}
