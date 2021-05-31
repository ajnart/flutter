import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deletetransaction;
  const TransactionList(this.transactions, this._deletetransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) => Column(
                  children: <Widget>[
                    Text(
                      'No transactions added yet!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/empty.png',
                          fit: BoxFit.fill,
                        )),
                  ],
                ))
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                elevation: 5,
                child: ListTile(
                  leading: Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(20)),
                    width: 80,
                    height: 50,
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("${transactions[index].amount}€", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  title: Text(transactions[index].title, style: Theme.of(context).textTheme.headline6),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 450
                      ? TextButton.icon(
                          onPressed: () => _deletetransaction(transactions[index].id),
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
                          onPressed: () => _deletetransaction(transactions[index].id),
                        ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
