import './transaction_item.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deletetransaction;
  const TransactionList(this.transactions, this._deletetransaction);

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return LayoutBuilder(
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
              ));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TransactionItem(transaction: transactions[index], deletetransaction: _deletetransaction);
        },
        itemCount: transactions.length,
      );
    }
  }
}
