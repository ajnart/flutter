import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deletetransaction;
  TransactionList(this.transactions, this._deletetransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.6,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 300,
                    child: Image.asset(
                      'assets/images/empty.png',
                      fit: BoxFit.fill,
                    )),
              ],
            )
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
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => _deletetransaction(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
