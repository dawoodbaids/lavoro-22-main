import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/text_theme.dart';
import '../../../global_widgets/logo_widget.dart';

class OnBoardingPage extends StatelessWidget {
  final double? height;
  final String? description;
  final ThemeData? data;

  const OnBoardingPage({
    Key? key,
    this.height,
    this.description,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: data ?? Get.theme,
      child: Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2),
              const LogoWidgetWithLabel(),
              const Spacer(),
              if (description != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description!,
                    style: AppStyle.headLine3.copyWith(
                      color: (data ?? Get.theme).colorScheme.onBackground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              const Spacer(flex: 2)
            ],
          ),
        ),
      ),
    );
  }
}
