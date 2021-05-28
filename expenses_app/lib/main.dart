import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 1, title: 'Shoes', ammount: 69.42, date: DateTime.now()),
    Transaction(id: 2, title: 'Groceries', ammount: 20, date: DateTime.now()),
    Transaction(
        id: 3, title: 'PH Premium', ammount: 9.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 150,
              child: Card(
                color: Colors.green,
                elevation: 5,
                child: Text("CHARTER"),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(child: Text(tx.ammount.toString())),
                    Column(
                      children: <Widget>[
                        Text(tx.title),
                        Text(tx.date.toString())
                      ],
                    )
                  ],
                ));
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
