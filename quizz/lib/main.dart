import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import './question.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
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
            Question(
              questions.elementAt(questionIndex)
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (questionIndex < questions.length - 1) questionIndex += 1;
                }),
                print(questionIndex)
              },
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
