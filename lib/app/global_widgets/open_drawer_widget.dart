import 'package:flutter/material.dart';

class OpenDrawerWidget extends StatelessWidget {
  const OpenDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        splashRadius: 10,
        icon: const Icon(Icons.menu),
      );
    });
  }
}
