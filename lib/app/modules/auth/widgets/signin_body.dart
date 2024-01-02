import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavoro/app/modules/auth/forget_page/themehelper.dart';

import '../../../core/utils/validators.dart';

import '../../../global_widgets/custom_textformfield.dart';
import '../../../global_widgets/headar_widget.dart';
import '../../../global_widgets/loading_widget.dart';

import '../../../global_widgets/text_theme.dart';
import '../controllers/signin_controller.dart';

import '../forget_page/for.dart';
import '../forget_page/forgetpassword.dart';

class SigninBody extends GetView<SigninController> {
  const SigninBody({Key? key}) : super(key: key);

  bool get isLoading => false;

  @override
  Widget build(BuildContext context) {
    double headerHeight = 300;
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      body: LoadingWidget(
        isLoading: isLoading,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: headerHeight,
              child: HeaderWidget(headerHeight, true, Icons.laptop, true),
            ),
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * .05),
                    Text(
                      "        Sign in to your account",
                      textAlign: TextAlign.center,
                      style: AppStyles.headLine1.copyWith(
                        color: Get.theme.colorScheme.onBackground,
                      ),
                    ),
                    SizedBox(height: Get.height * .05),
                    CustomTextFormField(
                      controller: controller.emailController,
                      prefixIcon: const Icon(Icons.email),
                      label: "Email",
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      validator: CustomValidator.validateEmail,
                      required: true,
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      controller: controller.passwordController,
                      prefixIcon: const Icon(Icons.lock),
                      label: "Password",
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword,
                      autofillHints: const [AutofillHints.password],
                      validator: CustomValidator.validatePassword,
                      required: true,
                    ),
                    const SizedBox(height: 13),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Forget());
                      },
                      child: const Text(
                        "   Forgot Your Password ?",
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 13),
                    Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          backgroundColor: Get.theme.colorScheme.primary,
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        ),
                        onPressed: () {
                          controller.login(
                            controller.emailController.text,
                            controller.passwordController.text,
                          );
                        },
                        child: Text(
                          "Sign In",
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.button.copyWith(
                            color: Get.theme.colorScheme.background,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        TextButton(
                          onPressed: controller.goToSignUpView,
                          child: const Text(
                            'Sign up',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * .1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
