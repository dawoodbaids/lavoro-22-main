import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/theme/text_theme.dart';
import '../core/values/consts.dart';

class LogoWidget extends StatelessWidget {
  final double height;
  final double width;
  final double padding;
  final double margin;
  final Color? foregroundColor;
  final Color? backgroundColor;
  const LogoWidget({
    super.key,
    this.height = 100,
    this.width = 100,
    this.padding = 8.0,
    this.margin = 0,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(margin),
          height: height,
          width: width,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: backgroundColor ?? Get.theme.colorScheme.onBackground,
            // color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            AppConstant.logo,
            color: foregroundColor ?? Get.theme.colorScheme.background,
          ),
        ),
      ],
    );
  }
}

class LogoWidgetWithLabel extends StatelessWidget {
  final String? label;
  final double height;
  final double width;
  final double padding;
  final double margin;
  const LogoWidgetWithLabel({
    super.key,
    this.label,
    this.height = 100,
    this.width = 100,
    this.padding = 8.0,
    this.margin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogoWidget(
          height: height,
          width: width,
          padding: padding,
          margin: margin,
        ),
        const SizedBox(height: 15),
        Text(
          label ?? AppConstant.appName,
          textAlign: TextAlign.center,
          style: AppStyle.headLine1.copyWith(
            color: context.theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
