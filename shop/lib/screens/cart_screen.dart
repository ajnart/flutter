import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart' show Cart;
import 'package:shop/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Consumer<Cart>(
                      builder: (_, e, widget) => Text('${e.getTotal.toStringAsFixed(2)}€',
                          style: TextStyle(color: Theme.of(context).primaryTextTheme.headline1!.color, fontSize: 15)),
                    ),
                  ),
                  TextButton(onPressed: () => {}, child: const Text('ORDER NOW'))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Consumer<Cart>(
            builder: (_, e, child) => Expanded(
              child: ListView.builder(
                itemCount: e.items.length,
                itemBuilder: (ctx, index) => CartItem(
                  id: e.items.values.toList()[index].id,
                  price: e.items.values.toList()[index].price,
                  quantity: e.items.values.toList()[index].quantity,
                  title: e.items.values.toList()[index].title,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
