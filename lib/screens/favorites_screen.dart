import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: productProvider.favorites.isEmpty
          ? const Center(child: Text('No favorites yet'))
          : ListView.builder(
              itemCount: productProvider.favorites.length,
              itemBuilder: (context, index) {
                final product = productProvider.favorites[index];
                return ProductCard(product: product);
              },
            ),
    );
  }
}