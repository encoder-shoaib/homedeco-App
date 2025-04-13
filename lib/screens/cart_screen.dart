import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: productProvider.cart.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: productProvider.cart.length,
              itemBuilder: (context, index) {
                final product = productProvider.cart[index];
                return ProductCard(product: product);
              },
            ),
      bottomNavigationBar: productProvider.cart.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Proceeding to checkout')),
                  );
                },
                child: const Text('Checkout'),
              ),
            )
          : null,
    );
  }
}