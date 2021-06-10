import 'package:flutter/material.dart';
import 'package:shop/screens/products_overview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.deepPurple,
      ),
      home: ProductsOverviewScreen(),
    );
  }
}
