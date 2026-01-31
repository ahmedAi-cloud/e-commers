import 'package:flutter/material.dart';
import '../models/product_modle.dart';


class CartProvider with ChangeNotifier {

  final List<Products> _items = [];

  List<Products> get items => _items;

  void addToCart(Products product) {
    _items.add(product);
    notifyListeners();
  }

  void removeFromCart(Products product) {
    _items.remove(product);
    notifyListeners();
  }


  dynamic get totalPrice {
    dynamic sum = 0;
    for (var item in _items) {
      sum += item.price;
    }
    return sum;
  }
}
