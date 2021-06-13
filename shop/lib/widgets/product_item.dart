import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/screens/product_detail.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.id,
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
          ),
          trailing: IconButton(
            onPressed: () => cart.addItem(product.id, product.price, product.title),
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
          ),
          leading: IconButton(
            onPressed: () => product.toggleFavorite(),
            icon: Consumer<Product>(
              builder: (BuildContext context, value, Widget? child) =>
                  Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
            ),
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
