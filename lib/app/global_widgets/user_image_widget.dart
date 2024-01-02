import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/user_model.dart';
import 'image_viewer_list.dart';

class UserImageWidget extends StatelessWidget {
  final double? size;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;
  final String? imageUrl;
  const UserImageWidget({
    super.key,
    this.size = 40,
    this.margin,
    this.onTap,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            ImageViewerList.show(imageUrls: [UserAccount.info!.imageUrl]);
          },
      child: ClipRRect(
            borderRadius: BorderRadius.circular(350),
            child: CachedNetworkImage(
              imageUrl: imageUrl ?? UserAccount.info?.imageUrl ?? '',
            height: size,
            width: size,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, download) {
              if (download.progress != null) {
                final percent = download.progress! * 100;
                return Center(
                  child: FittedBox(
                    child: Text('${percent.toStringAsFixed(1)}%'),
                  ),
                );
              }
              return const Center(child: FittedBox(child: Text('Loading')));
            },
            errorWidget: (context, url, error) => Icon(
              Icons.account_circle,
              size: size,
            ),
          )
    ));

        }
    
    
  }

