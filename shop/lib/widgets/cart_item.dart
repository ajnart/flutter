import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final String title;
  final int quantity;
  const CartItem({
    Key? key,
    required this.id,
    required this.price,
    required this.title,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(child: Text('${price.toInt()}€')),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: ${quantity * price}€'),
          trailing: Text('${quantity}x'),
        ),
      ),
    );
  }
}
