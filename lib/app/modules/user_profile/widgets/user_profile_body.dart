import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavoro/app/data/model/chatuser_db.dart';

import '../../../core/utils/helpers/system_helper.dart';
import '../../../data/model/user_model.dart';
import 'custom_header_widget.dart';
import 'custom_profile_listtile.dart';

class UserProfileBody extends StatelessWidget {
  const UserProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserAccount.info;
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar(
          'Error',
          'User information not available.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });

      return const Center(
        child: CircularProgressIndicator(), // or display an error message
      );
    }

    // Extracting selected languages
    List<dynamic> selectedLanguages = user.selectedLanguages;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      children: <Widget>[
        const SizedBox(height: 20),
        const CustomHeaderWidget(),
        CustomProfileListTile(
          label: user.username,
          icons: Icons.text_fields,
          showCopyButton: false,
        ),
        CustomProfileListTile(
          label: user.email,
          icons: Icons.email,
          showCopyButton: true,
        ),
        CustomProfileListTile(
          label: user.phoneNumber,
          icons: Icons.phone,
          onTap: () => SystemHelper.makeCall(user.phoneNumber),
        ),
        CustomProfileListTile(
          label: user.country,
          icons: Icons.location_city,
          showCopyButton: false,
        ),
        CustomProfileListTile(
          label: user.descrption,
          icons: Icons.description,
          showCopyButton: false,
        ),
        // Displaying selected languages
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(
                'Programing Languages:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: selectedLanguages.length,
              itemBuilder: (context, index) {
                return CustomProfileListTile(
                  label: selectedLanguages[index],
                  icons: Icons.language,
                  showCopyButton: false,
                  // Add other properties or actions if needed
                );
              },
            ),
          ],
        ),
        SizedBox(height: Get.height * .1),
      ],
    );
  }
}
