import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/helpers/custom_bottom_sheet.dart';
import '../../../data/model/user_model.dart';
import '../../../data/provider/firebase_image.dart';
import '../../../global_widgets/image_viewer_list.dart';

class CustomHeaderWidget extends StatefulWidget {
  const CustomHeaderWidget({
    super.key,
  });

  @override
  State<CustomHeaderWidget> createState() => _CustomHeaderWidgetState();
}

class _CustomHeaderWidgetState extends State<CustomHeaderWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final user = UserAccount.info;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              ImageViewerList.show(imageUrls: [user!.imageUrl]);
            },
            child: Stack(
              children: [
                Hero(
                  tag: user!.imageUrl,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          width: 140,
                          height: 140,
                          image: CachedNetworkImageProvider(user.imageUrl),
                        ),
                      ),
                    ),
                  ),
                ),
                if (isLoading)
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: CircularProgressIndicator(),
                  ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: MaterialButton(
                    height: 35,
                    minWidth: 35,
                    shape: CircleBorder(
                      side: BorderSide(
                        color: Get.theme.colorScheme.background,
                        width: 4,
                      ),
                    ),
                    color: Get.theme.colorScheme.background,
                    child: Icon(
                      Icons.edit,
                      size: 16.0,
                      color: Get.theme.colorScheme.onBackground,
                    ),
                    onPressed: () async {
                      final res = await CustomBottomSheet.imagePiker();
                      if (res != null) {
                        setState(() => isLoading = true);
                        final imagePath = res.path;
                        final uid = UserAccount.currentUser!.uid!;
                        final newImageUrl = await FirebaseImage.uploadUserImage(
                          imagePath: imagePath,
                          uid: uid,
                        );
                        if (newImageUrl != null) {
                          UserAccount.currentUser!.imageUrl = newImageUrl;
                        }
                        setState(() => isLoading = false);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              user.username,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.remove_red_eye),
              SizedBox(width: 10),
              Text(
                'visitors: 0',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
