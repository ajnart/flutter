import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class _Transaction {
  final String day;
  final double amount;
  _Transaction(this.day, this.amount);
}

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<_Transaction> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == recentTransactions[i].date.month &&
            recentTransactions[i].date.year == recentTransactions[i].date.year)
          totalSum += recentTransactions[i].amount;
      }
      return _Transaction(DateFormat.E().format(weekDay).substring(0, 1), totalSum);
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + element.amount + 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                e.day,
                e.amount,
                totalSpending == 0.0 ? 0.0 : e.amount / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
