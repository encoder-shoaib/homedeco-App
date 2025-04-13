import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Category> categories = const [
    Category(id: 1, name: 'Furniture', imageUrl: 'assets/images/room_living.jpg'),
    Category(id: 2, name: 'Wall Art', imageUrl: 'assets/images/product3.jpg'),
    Category(id: 3, name: 'Lighting', imageUrl: 'assets/images/product2.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            elevation: 2,
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(category.imageUrl, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(category.name),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}