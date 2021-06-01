import 'package:expenses_app/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        accentColor: Colors.orange,
      ),
      title: 'Personal expenses app',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showChart = false;
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 124.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 75.4,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 't3',
      title: 'Spotify premium',
      amount: 9.99,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't4',
      title: 'Netflix',
      amount: 15.99,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime date) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: date,
      id: DateTime.now().toString(),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added $txAmount€ on ${DateFormat.MMMMEEEEd().format(date)} for $txTitle'),
        duration: Duration(seconds: 2),
      ),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((e) => e.id == id);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final _mq = MediaQuery.of(context);
    final isLandscape = _mq.orientation == Orientation.landscape;
    final appBar = AppBar(
      title: const Text('Personal Expenses App'),
      actions: <Widget>[
        if (isLandscape)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Show chart',
                style: TextStyle(color: Theme.of(context).buttonColor),
              ),
              Switch(
                value: _showChart,
                onChanged: (value) => setState(() {
                  _showChart = value;
                }),
              ),
            ],
          ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (!isLandscape)
              Container(
                  height: (_mq.size.height - appBar.preferredSize.height - _mq.padding.top) * 0.3,
                  child: Chart(_recentTransactions)),
            Container(
                height: (_mq.size.height - appBar.preferredSize.height - _mq.padding.top) * 0.7,
                child: TransactionList(_userTransactions, _deleteTransaction)),
            if (_showChart)
              Container(
                  height: (_mq.size.height - appBar.preferredSize.height - _mq.padding.top) * 0.8,
                  child: Chart(_recentTransactions))
            else
              Container(
                  height: (_mq.size.height - appBar.preferredSize.height - _mq.padding.top),
                  child: TransactionList(_userTransactions, _deleteTransaction)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS || isLandscape
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
    );
  }
}
