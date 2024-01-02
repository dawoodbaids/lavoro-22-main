// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/loading_widget.dart';

import '../controllers/Type.dart';
import '../widgets/register_body_employee.dart';

class RegisterViewEmployee extends GetView<SignupController> {
  const RegisterViewEmployee({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      isLoading: controller.isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Create Employee Account',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
          ),
        ),
        body: const RegisterBodyEmployee(),
      ),
    );
  }
}
