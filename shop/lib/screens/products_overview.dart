import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/widgets/badge.dart';
import 'package:shop/widgets/products_grid.dart';

enum Filters {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyShop"),
        actions: [
          PopupMenuButton(
            onSelected: (Filters filter) {
              print(filter);
              setState(() {
                if (filter == Filters.Favorites) _showOnlyFavorites = true;
                if (filter == Filters.All) _showOnlyFavorites = false;
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(child: Text('Only favorites'), value: Filters.Favorites),
              const PopupMenuItem(child: Text('Show all'), value: Filters.All),
            ],
            icon: Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
            builder: (_, Cart cart, Widget? child) => Badge(
              child: child!,
              value: cart.countItems.toString(),
            ),
            child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
