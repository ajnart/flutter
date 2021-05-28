import 'package:flutter/material.dart';

import 'new_transactions.dart';
import 'transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(id: '1', title: 'Shoes', ammount: 69.42, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Groceries', ammount: 20.00, date: DateTime.now()),
    Transaction(
        id: '3', title: 'PH Premium', ammount: 9.99, date: DateTime.now()),
  ];

  void _addTransaction(String title, double ammount) {
    final newTx = Transaction(
      title: title,
      ammount: ammount,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransaction),
        Transactions(_transactions),
      ],
    );
  }
}
