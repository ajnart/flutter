import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String id;
  bool isFavorite = false;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.id,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
