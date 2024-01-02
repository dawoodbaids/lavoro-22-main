import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavoro/app/global_widgets/custom_button.dart';
import 'package:lavoro/app/global_widgets/custom_textformfield.dart';

import '../../../global_widgets/headar_widget.dart';
import '../../../global_widgets/loading_widget.dart';
import '../../../global_widgets/text_theme.dart';

class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  final _emailController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      // Show a success message or navigate to another screen upon successful password reset email sending
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Email Sent'),
            content:
                const Text('Password reset link has been sent to your email.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      // Show error message to the user that the password reset email couldn't be sent
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content:
                const Text('Failed to send reset email. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

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
              child: HeaderWidget(headerHeight, true, Icons.lock, false),
            ),
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forgot Your Password ',
                          style: AppStyles.headLine1.copyWith(
                            color: Get.theme.colorScheme.onBackground,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '            Enter The Email Address',
                          style: AppStyles.bodyText2,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '      We Will Send You a message ',
                          style: AppStyles.subTitle3,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _emailController,
                      label: "Email",
                      hintText: "Enter Your Email",
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Email Can't Be Empty";
                        } else if (!RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
                        ).hasMatch(val)) {
                          return "Enter Valid Email Address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      label: "Send Reset Link",
                      onPressed: () {
                        if (_emailController.text.trim().isEmpty) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: const Text('Please enter your email.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // Close the dialog
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          passwordReset(); // Initiate the password reset process
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                  text: "    Remember Your Password ?  ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontStyle: FontStyle.italic)),
                              TextSpan(
                                text: 'lOGIN'.tr,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.back();
                                  },
                                style: AppStyles.smallButton.copyWith(
                                  color: Get.theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
