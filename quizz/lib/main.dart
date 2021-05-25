import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import './answers.dart';
import './question.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  ThemeMode getCurrentTheme() => _isDark ? ThemeMode.dark : ThemeMode.light;
  static bool _isDark = false;
  var questionIndex = 0;
  final questions = [
    'Do you like apples ? 🍎',
    'Do you like skiing ? ⛷',
    'What\'s your favorite animal ? 🐕',
  ];
  void buttonPressed(int id, List<String> questions) {
    setState(() {
      if (questionIndex < questions.length - 1) questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: getCurrentTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Appbar'),
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.all(8.5),
          child:
              //your elements here
              ElevatedButton(
            onPressed: () => setState(() {
              _isDark = !_isDark;
            }),
            child: Icon(
              Icons.dark_mode,
              color: _isDark
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).primaryColorDark,
              size: 30.0,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Question(questionIndex, questions),
            Answers(questionIndex, buttonPressed),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(App());
