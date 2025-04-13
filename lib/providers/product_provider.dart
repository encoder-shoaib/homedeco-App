import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 1,
      name: 'Modern Sofa',
      price: 299.99,
      imageUrl: 'assets/images/product1.jpg',
      category: 'Furniture',
    ),
    Product(
      id: 2,
      name: 'Table Lamp',
      price: 49.99,
      imageUrl: 'assets/images/product2.jpg',
      category: 'Lighting',
    ),
    Product(
      id: 3,
      name: 'Wall Art',
      price: 79.99,
      imageUrl: 'assets/images/product3.jpg',
      category: 'Wall Art',
    ),
  ];

  final List<Product> _favorites = [];
  final List<Product> _cart = [];

  List<Product> get products => _products;
  List<Product> get favorites => _favorites;
  List<Product> get cart => _cart;

  void toggleFavorite(Product product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}