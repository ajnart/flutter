import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final answers = [
    ['Yes', 'No'],
    ['Yes', 'No'],
    ['Cat 🐈', 'Dog 🐕', 'Panda 🐼', 'Cow 🐄'],
  ];

  final Function buttonpressedHandler;
  final int questionIndex;
  Answers(this.questionIndex, this.buttonpressedHandler);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (String i in answers.elementAt(questionIndex))
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              key: Key(i),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primaryVariant),
              ),
              onPressed: () {
                print(
                    // TODO: Kill this monstrosity
                    'Pressed : ${answers.elementAt(questionIndex).elementAt(answers.elementAt(questionIndex).indexOf(i))}');
                buttonpressedHandler(
                    answers.elementAt(questionIndex).indexOf(i));
              },
              child: Text(i),
              autofocus: false,
            ),
          ),
      ],
    );
  }
}
