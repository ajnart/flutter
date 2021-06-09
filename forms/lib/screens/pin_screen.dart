import 'dart:io';

import 'package:flutter/material.dart';
import 'package:forms/models/user.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PinScreen extends StatefulWidget {
  static const RouteName = "/pin";
  final User user;
  PinScreen(this.user);

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final TextEditingController _pinPutController = TextEditingController();

  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(color: Colors.blue[900]!.withOpacity(0.5), borderRadius: BorderRadius.circular(20.0));
  }

  void _displayDialog() async {
    await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: const Text("That's it!"),
        content: const Text('I didnt continue the app beyond that.'),
        actions: <Widget>[
          new ElevatedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(); // dismisses only the dialog and returns nothing
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
    _pinPutController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text("Step 2/2", style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Enter your PIN code", style: Theme.of(context).textTheme.subtitle1),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 40,
                  width: 300,
                  child: PinPut(
                    autofocus: true,
                    obscureText: '',
                    fieldsCount: 4,
                    onSubmit: (e) => _displayDialog(),
                    focusNode: _pinPutFocusNode,
                    controller: _pinPutController,
                    submittedFieldDecoration: _pinPutDecoration.copyWith(
                      color: Colors.blue[900],
                    ),
                    selectedFieldDecoration: _pinPutDecoration,
                    followingFieldDecoration: _pinPutDecoration,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
