import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class App extends StatelessWidget {
  var questionIndex = 0;
  var questions = [
    'Do you like apples ? 🍎',
    'Do you like skiing ? ⛷',
    'What\'s your favorite animal ? 🐕',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Appbar'),
        ),
        body: Column(
          children: <Widget>[
            Text(questions.elementAt(0)),
            ElevatedButton(
              onPressed: () => {},
              child: Text('Say hello'),
              autofocus: true,
            )
          ],
        ),
      ),
    );
  }
}

void main() => runApp(App());
