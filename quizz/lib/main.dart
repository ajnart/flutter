import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Appbar'),
        ),
        body: Column(children: <Widget>[
          ElevatedButton(onPressed: null, child: Text('Say hello'), autofocus: true,)
        ],),
      ),
    );
  }
}

void main() => runApp(App());
