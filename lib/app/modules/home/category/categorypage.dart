import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  final String imagepath;

  const CategoryPage(
      {Key? key, required this.categoryName, required this.imagepath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildCategoryRow(
              categories: [
                {
                  'image': 'Image.asset(imagepath), ',
                  'name': 'Category 4',
                  'country': 'Country 4',
                  'category': 'Category D',
                },
                {
                  'image': 'Image.asset(imagepath), ',
                  'name': 'Category 4',
                  'country': 'Country 4',
                  'category': 'Category D',
                },
              ],
            ),
            const SizedBox(height: 20),
            buildCategoryRow(
              categories: [
                {
                  'image': 'Image.asset(imagepath), ',
                  'name': 'Category 4',
                  'country': 'Country 4',
                  'category': 'Category D',
                },
                {
                  'image': 'Image.asset(imagepath), ',
                  'name': 'Category 4',
                  'country': 'Country 4',
                  'category': 'Category D',
                },
              ],
            ),
            // Add more rows as needed
          ],
        ),
      ),
    );
  }

  Widget buildCategoryRow({required List<Map<String, String>> categories}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: categories.map((category) {
        return buildCategoryCard(
          image: category['image']!,
          name: category['name']!,
          country: category['country']!,
          category: category['category']!,
        );
      }).toList(),
    );
  }

  Widget buildCategoryCard({
    required String image,
    required String name,
    required String country,
    required String category,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
              
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(imagepath,
        
              height: 80,
              width: 80,
              fit: BoxFit.cover,), // Use the imagepath from the previous page
          const Text('Name : fares'),
          const Text('Country'),
          Text('Category: $categoryName'),
           
        ],
      ),
    );
  }
}
