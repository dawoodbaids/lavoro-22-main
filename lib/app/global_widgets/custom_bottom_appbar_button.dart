import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarButton extends StatelessWidget {
  final String label;
  final IconData icons;
  final VoidCallback? onPressed;
  final bool isActive;
  const CustomBottomAppBarButton({
    super.key,
    this.onPressed,
    required this.label,
    required this.icons,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    //final any = AuthController.instance.isUserSignedInAnonymously();

    return Tooltip(
      message: label,
      child: MaterialButton(
        minWidth: Get.width * 0.19,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
