import 'package:flutter/material.dart';

import '../widgets/user_profile_body.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User profile'),
        centerTitle: true,
      ),
      body: const UserProfileBody(),
    );
  }
}
