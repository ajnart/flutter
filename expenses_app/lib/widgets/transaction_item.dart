import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required Function deletetransaction,
  })  : _deletetransaction = deletetransaction,
        super(key: key);

  final Transaction transaction;
  final Function _deletetransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      elevation: 5,
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(20)),
          width: 80,
          height: 50,
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("${transaction.amount}€", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        title: Text(transaction.title, style: Theme.of(context).textTheme.headline6),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 450
            ? TextButton.icon(
                onPressed: () => _deletetransaction(transaction.id),
                label: const Text('Delete'),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
              )
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => _deletetransaction(transaction.id),
              ),
      ),
    );
  }
}
