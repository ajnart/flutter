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

  void buttonPressed(int id) {
    print('Clicked on button $id');
    setState(() {
      if (questionIndex < questions.length - 1) questionIndex += 1;
    });
  }

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
                for (String i in answers.elementAt(questionIndex))
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.primaryVariant),
                      ),
                      onPressed: () => buttonPressed(
                          answers.elementAt(questionIndex).indexOf(i)),
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
