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
      price: 299.99,
      imageUrl: 'assets/images/product2.jpg',
      category: 'Furniture',
    ),
    Product(
      id: 3,
      name: 'Dining Table',
      price: 299.99,
      imageUrl: 'assets/images/product3.jpg',
      category: 'Furniture',
    ),
    // ... other products
  ];

  final List<Product> _favorites = [];
  final List<Product> _cart = [];

  List<Product> get products => _products;
  List<Product> get favorites => _favorites;
  List<Product> get cart => _cart;

  // New: Track product quantities in cart
  final Map<int, int> _cartQuantities = {};

  int getCartQuantity(Product product) {
    return _cartQuantities[product.id] ?? 0;
  }

  void addToCart(Product product) {
    if (_cart.contains(product)) {
      _cartQuantities[product.id] = (getCartQuantity(product) + 1);
    } else {
      _cart.add(product);
      _cartQuantities[product.id] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (_cart.contains(product)) {
      if (getCartQuantity(product) > 1) {
        _cartQuantities[product.id] = (getCartQuantity(product) - 1);
      } else {
        _cart.remove(product);
        _cartQuantities.remove(product.id);
      }
      notifyListeners();
    }
  }

  void removeAllFromCart(Product product) {
    _cart.remove(product);
    _cartQuantities.remove(product.id);
    notifyListeners();
  }

  double get cartTotal {
    return _cart.fold(0, (total, product) {
      return total + (product.price * getCartQuantity(product));
    });
  }

  void toggleFavorite(Product product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }
}