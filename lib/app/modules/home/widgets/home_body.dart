// ... other importsUser
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../../global_widgets/adv.dart';

import '../../../global_widgets/text_theme.dart';
import '../category/lang.dart';


class HomeBody extends StatelessWidget {
  const HomeBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSection(),
          SizedBox(height: 20),
          Text(
            "Programming Languages",
            style: AppStyles.headLine3.copyWith(
              color: Get.theme.colorScheme.onBackground,
            ),
            textAlign: TextAlign.start,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: CategoriesRow(),
          ),
          SizedBox(height: 15),
          Text(
            "Recommend Jobs for you",
            style: AppStyles.headLine3.copyWith(
              color: Get.theme.colorScheme.onBackground,
            ),
            textAlign: TextAlign.start,
          ),
          // Wrap the Row with SingleChildScrollView
         
        ],
      ),
    );
  }
}

// ... rest of the code