import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product-detail";
  @override
  Widget build(BuildContext context) {
    final String productId = ModalRoute.of(context)!.settings.arguments as String;
    // Get productData from ID
    return Scaffold(
      appBar: AppBar(title: Text('')),
    );
  }
}
