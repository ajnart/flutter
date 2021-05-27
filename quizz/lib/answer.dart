import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final Function callback;
  Answer(this.text, this.callback);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        key: Key(text),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.primaryVariant),
        ),
        onPressed: () {
          print('Pressed : $text pressed.}');
          callback(text);
        },
        child: Text(text),
        autofocus: false,
      ),
    );
  }
}
