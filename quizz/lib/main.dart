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
  var answers = [
    ['Yes', 'No'],
    ['Yes', 'No'],
    ['Cat 🐈', 'Dog 🐕', 'Panda 🐼', 'Cow 🐄'],
  ];
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
            Question(questions.elementAt(questionIndex)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (var i in answers.elementAt(questionIndex))
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => {
                        setState(() {
                          if (questionIndex < questions.length - 1)
                            questionIndex += 1;
                        }),
                      },
                      child: Text(i),
                      autofocus: true,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(App());
