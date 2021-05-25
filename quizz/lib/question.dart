import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final int questionIndex;
  final List<String> questions;

  Question(
    this.questionIndex,
    this.questions,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (this.questionIndex != this.questions.length) ...[
              Text(
                questions.elementAt(questionIndex),
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ));
  }
}
