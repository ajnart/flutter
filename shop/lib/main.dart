import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/products_overview.dart';
import './providers/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Returns a new instance of the products item
      create: (BuildContext context) => Products(),
      child: MaterialApp(
        title: 'Shop',
        theme: ThemeData(
          textTheme: TextTheme(
            headline1: TextStyle(fontFamily: 'Anton'),
          ),
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        home: ProductsOverviewScreen(),
      ),
    );
  }
}
