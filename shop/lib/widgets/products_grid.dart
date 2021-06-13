import 'package:flutter/material.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showOnlyFavorites;

  const ProductsGrid(this.showOnlyFavorites);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showOnlyFavorites ? productsData.favorites : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(2),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products.elementAt(i),
        child: ProductItem(),
      ),
    );
  }
}