import 'package:flutter/material.dart';

import 'categorypage.dart';

class CategoryBox extends StatelessWidget {
  final String imagePath;
  final String name;
  final Function() onPressed;

  const CategoryBox({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to CategoryPage and send the name
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              categoryName: name,
              imagepath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          // Set background color here
          border: Border.all(
            color: Colors.black, // Set border color here
            width: 2.0, // Set border width here
          ),
          borderRadius: BorderRadius.circular(10.0), // Set border radius here
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            Text(name, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
