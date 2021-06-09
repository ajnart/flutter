import 'package:flutter/material.dart';
import 'package:forms/models/user.dart';

class PinScreen extends StatelessWidget {
  final User user;
  const PinScreen(this.user);
  static const RouteName = "/pin";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Étape 2/2", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(user.phone),
        ],
      ),
    );
  }
}
