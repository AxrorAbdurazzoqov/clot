import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final String title;
  final num price;
  int quantity = 1;

  ProductProvider({required this.title, required this.price});

  void decrement() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }

  void increment() {
    quantity++;
    notifyListeners();
  }
}
