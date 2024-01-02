// ... other imports

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

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
          SizedBox(height: 10),
          // Use ListView.builder to display multiple CardViews
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount:
                3, // Replace with the actual number of cards you want to display
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: MyCardView(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MyCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          // Image on the left
          Image.asset(
           'assets/images/Py.png', 
            height: 75,
            width: 75,
            fit: BoxFit.cover,
          ),
          // Padding for separation
          SizedBox(width: 8),
          // Text on the right
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name : freas ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                   'City : maan',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'python',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'City : maan',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
