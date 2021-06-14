import 'package:flutter/foundation.dart';
import 'package:shop/providers/cart.dart';

class OrderItem {
  final String id;
  final double ammount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.ammount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _items = [];
  List<OrderItem> get items {
    // Return a copy instead of the pointer to the item
    return [..._items];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _items.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        ammount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }

  void clear() {
    _items = [];
    notifyListeners();
  }
}
