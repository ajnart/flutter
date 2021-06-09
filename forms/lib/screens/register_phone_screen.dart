import 'package:flutter/material.dart';
import 'package:forms/widgets/phone_number.dart';

class RegisterPhoneScreen extends StatefulWidget {
  static const routeName = '/register-phone';

  @override
  _RegisterPhoneScreenState createState() => _RegisterPhoneScreenState();
}

class _RegisterPhoneScreenState extends State<RegisterPhoneScreen> {
  bool isNumberValid = false;

  final numberValidatorRegex = RegExp(r'[0]{1}[6-7]{1}[0-9]{8}');

  void numberValidator(String number) {
    // Remove the spaces in the printed output
    setState(() {
      isNumberValid = (numberValidatorRegex.hasMatch(number.replaceAll(' ', '')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("Étape 1/2", style: TextStyle(color: Colors.black)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        backgroundColor: isNumberValid ? Colors.blue : Colors.grey,
        elevation: 2,
        autofocus: false,
        onPressed: isNumberValid ? () {} : null,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: PhoneNumberWidget(numberValidator),
            // child: TextFormField(
            //   autofocus: true,
            //   //controller: _phoneController,
            //   cursorColor: Colors.grey,
            //   maxLengthEnforcement: MaxLengthEnforcement.enforced,
            //   maxLength: 10,
            //   maxLines: 1,
            //   keyboardType: TextInputType.phone,
            //   onChanged: (e) => numberValidator,
            //   style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
            //   decoration: InputDecoration(
            //       hintStyle: TextStyle(color: Colors.grey),
            //       border: InputBorder.none,
            //       counterText: "",
            //       contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            //       hintText: "06 10 20 30 40"),
            // ),
          ),
        ),
      ),
    );
  }
}
