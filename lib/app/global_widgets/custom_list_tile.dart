import 'package:flutter/material.dart';

import '../core/theme/text_theme.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icons;

  final void Function()? onTap;
  const CustomListTile({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.icons,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        child: ListTile(
          title: Text(
            title,
            style: AppStyle.headLine5,
          ),
          subtitle: Text(
            subtitle,
            style: AppStyle.subTitle3,
          ),
          leading: Icon(icons),
          trailing: onTap != null
              ? const Icon(Icons.arrow_forward, color: Colors.grey)
              : null,
          onTap: onTap,
        ),
      ),
    );
  }
}
