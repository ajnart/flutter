import 'package:flutter/material.dart';

import 'package:forms/models/user.dart';
import 'package:forms/screens/pin_screen.dart';
import 'package:forms/widgets/phone_number.dart';

class RegisterPhoneScreen extends StatefulWidget {
  static const routeName = '/register-phone';
  final User user;

  RegisterPhoneScreen(this.user);

  @override
  _RegisterPhoneScreenState createState() => _RegisterPhoneScreenState();
}

class _RegisterPhoneScreenState extends State<RegisterPhoneScreen> {
  bool isNumberValid = false;

  final numberValidatorRegex = RegExp(r'[0]{1}[6-7]{1}[0-9]{8}');

  void numberValidator(String number) {
    // Remove the spaces in the printed output
    if (number.length == 13 && isNumberValid)
      setState(() {
        isNumberValid = false;
      });
    else if (number.length != 14) return;
    setState(() {
      isNumberValid = (numberValidatorRegex.hasMatch(number.replaceAll(' ', '')));
    });
    if (isNumberValid == true) {
      widget.user.phone = number;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Step 1/2", style: TextStyle(color: Colors.black)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward,
          size: 20,
        ),
        backgroundColor: isNumberValid ? Colors.blue[800] : Colors.grey,
        elevation: 2,
        autofocus: false,
        onPressed: isNumberValid ? () => Navigator.of(context).pushNamed(PinScreen.RouteName) : null,
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter your French phone number",
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
              PhoneNumberWidget(numberValidator),
            ],
          ),
        ),
      ),
    );
  }
}
