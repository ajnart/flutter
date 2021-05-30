import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 300,
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
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FittedBox(
                            child: Text("${transactions[index].amount}€"),
                          ),
                        ),
                      ),
                      title: Text(transactions[index].title, style: Theme.of(context).textTheme.headline6),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
      ),
    );
  }
}
