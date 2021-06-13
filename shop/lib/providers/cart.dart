import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({required this.id, required this.title, required this.quantity, required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get countItems {
    int quantity = 0;
    _items.forEach((key, value) {
      quantity += value.quantity;
    });
    return quantity;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (e) => CartItem(
                title: e.title,
                id: e.id,
                price: e.price,
                quantity: e.quantity + 1,
              ));
    } else
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                price: price,
                title: title,
                quantity: 1,
              ));
    notifyListeners();
  }
}
