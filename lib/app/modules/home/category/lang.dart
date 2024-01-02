import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'categorybox.dart';

class CategoriesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryBox(
          imagePath: 'assets/images/sql.png',
          name: 'sql',
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/Py.png',
          name: 'Paython',
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/c#.png',
          name: 'C# (C-Sharp) ',
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/flutter.png',
          name: 'Flutter',
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/html.png',
          name: 'Html',
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/others.png',
          name: 'Other',
          onPressed: () {
            handleCategorySelection();
          },
        ),
      ],
    );
  }

// ignore: non_constant_identifier_names

  void handleCategorySelection() {
    // Implement your logic to handle the selected category
    if (kDebugMode) {
      print('Selected Category: ,');
    }
  }
}
