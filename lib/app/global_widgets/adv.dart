// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../modules/home/widgets/custom_adv.dart';

// ignore: use_key_in_widget_constructors
class CarouselSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
 
      child: CarouselContainer(
        imageUrls: const [
          'https://mostaql.hsoubcdn.com/uploads/thumbnails/1176897/63ad33c83c003/12218.jpg',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkBpXijVUC9uaLqxV7Ps8CBbnf--09zyqt9Q&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLPRPv1Ko9oqB7h_IvOWcRVP5AGaotcoROFg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKpTZcDIHJw977lAspfwFlhEGWbrpIb6_eAg&usqp=CAU',
          'https://scontent.famm11-1.fna.fbcdn.net/v/t31.18172-8/10353289_911160948900469_4877796891270672131_o.jpg?_nc_cat=107&ccb=1-7&_nc_sid=c2f564&_nc_eui2=AeGS7vjyLJRTMthDK17fX7yx3KJz2SYqRMfconPZJipEx6Z-6sFIBzLERiV-s2cBwVJv0zqyppof7lXJ9mpKBCyR&_nc_ohc=IPsYmmB2ORwAX9G1L1M&_nc_ht=scontent.famm11-1.fna&oh=00_AfDHlv1O98lQT1StsdQkeAN657gswUc_YVElDYuFCYjtKA&oe=65B28002',
        ],
        imageLinks: const [
          "https://www.google.com/",
          "https://www.google.com/",
          "https://www.google.com/",
          "https://www.google.com/",
          "https://www.google.com/",
        ],
      ),
   
    );
   
  }
}