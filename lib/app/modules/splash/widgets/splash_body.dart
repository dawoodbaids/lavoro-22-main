import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/logo_widget.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(flex: 2),
        LogoWidget(
          height: Get.height * .5,
          width: Get.height * .5,
          padding: 18.0,
          backgroundColor: Colors.transparent,
          foregroundColor: Get.theme.colorScheme.onBackground,
        ),
        const Spacer(flex: 1),
        const Center(
          child: CircularProgressIndicator(),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
