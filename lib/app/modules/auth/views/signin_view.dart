import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/loading_widget.dart';
import '../controllers/signin_controller.dart';
import '../widgets/signin_body.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoadingWidget(
      //isLoading: controller.isLoading,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(),
          body: SigninBody(),
        ),
      ),
    );
  }
}
