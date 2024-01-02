// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lavoro/app/modules/auth/widgets/register_body_company.dart';

import '../../../global_widgets/loading_widget.dart';
import '../controllers/Type.dart';

class RegisterViewCompany extends GetView<SignupController> {
  const RegisterViewCompany({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      isLoading: controller.isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Create Company Account',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
          ),
        ),
        body: const RegisterBodyCompany(),
      ),
    );
  }
}
