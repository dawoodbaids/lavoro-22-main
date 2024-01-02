import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/helpers/system_helper.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/logo_widget.dart';
import '../../../global_widgets/text_theme.dart';
import '../controllers/Type.dart';

class SignupBody extends GetView<SignupController> {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => SystemHelper.closeKeyboard(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: Get.width,
        height: Get.height,
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              SizedBox(height: Get.height * .05),
              LogoWidget(
                height: Get.height * .2,
                width: Get.height * .2,
              ),
              SizedBox(height: Get.height * .10),
              Text(
                "Sign up to your account",
                textAlign: TextAlign.center,
                style: AppStyles.headLine1.copyWith(
                  color: Get.theme.colorScheme.onBackground,
                ),
              ),
              SizedBox(height: Get.height * .033),
              CustomButton(
                label: "Company",
                onPressed: controller.onSignupComapny,
              ),
              SizedBox(height: Get.height * .02),
              CustomButton(
                label: "Employee",
                onPressed: controller.onSignupEmployee,
              ),
              SizedBox(height: Get.height * .02),
            ],
          ),
        ),
      ),
    );
  }
}
