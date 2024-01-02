import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../global_widgets/custom_card.dart';

class CustomBottomSheet {
  static Future<XFile?> imagePiker({
    String title = "Choses profile photo",
    VoidCallback? onCameraPressed,
    VoidCallback? onGalleryPressed,
  }) async {
    final ImagePicker imagePicker = ImagePicker();
    return await Get.bottomSheet(
      Container(
        height: Get.height * .3,
        width: Get.width,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomCard(
                    title: "camera",
                    icons: Icons.camera,
                    onTap: () async {
                      if (onCameraPressed == null) {
                        final image = await imagePicker.pickImage(
                            source: ImageSource.camera);
                        Get.back(result: image);
                      } else {
                        onCameraPressed.call();
                        Get.back();
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    title: "gallery",
                    icons: Icons.image,
                    onTap: () async {
                      if (onGalleryPressed == null) {
                        final image = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        Get.back(result: image);
                      } else {
                        onGalleryPressed.call();
                        Get.back();
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
