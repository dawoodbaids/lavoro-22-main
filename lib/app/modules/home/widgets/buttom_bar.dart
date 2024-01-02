import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavoro/app/modules/home/views/home_view.dart';

import '../../user_profile/view/user_profile_view.dart';

import '../../userchat/user_chat.dart';
import '../controllers/home_controller.dart';

class HomeBottomAppBar extends GetView<HomeController> {
  // ignore: use_key_in_widget_constructors
  const HomeBottomAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Get.theme.colorScheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            iconSize: 40,
          color: Colors.white,
            onPressed: () {
              Get.to(() => const HomeView()); // Navigate to HomeView
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            iconSize: 40,
           color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserProfileView()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat),
            iconSize: 30,
            color: Colors.white,
        
          
            onPressed: () {
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const ChatUser()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_add_alt),
            iconSize: 40,
     
              color: Colors.white,
         

            onPressed: () {
              // Handle the onPressed action fsor the fourth icon
            },
          ),
        ],
      ),
    );
  }
}