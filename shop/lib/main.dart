import 'package:flutter/material.dart';
import 'package:shop/screens/product_detail.dart';
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
        textTheme: TextTheme(
          headline1: TextStyle(fontFamily: 'Anton'),
        ),
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
      ),
      home: ProductsOverviewScreen(),
      routes: {
        ProductDetailScreen.routeName : (ctx) => ProductDetailScreen()
      },
    );
  }
}
