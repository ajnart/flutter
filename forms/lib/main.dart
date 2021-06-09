import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:forms/screens/register_phone_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color darkblue = Color.fromRGBO(40, 60, 220, 1);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color.fromRGBO(40, 60, 220, 1),
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              color: darkblue,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(darkblue),
            ),
          )),
      home: MyHomePage(),
      routes: {
        RegisterPhoneScreen.routeName: (ctx) => RegisterPhoneScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        elevation: 2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.api,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text('FORMS', style: Theme.of(context).textTheme.headline1),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              ElevatedButton(
                style: ButtonStyle(elevation: MaterialStateProperty.all(2)),
                onPressed: () {
                  Navigator.pushNamed(context, RegisterPhoneScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                  child: Text("S'inscrire", style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "J'ai déjà un compte",
                  style: TextStyle(
                      fontSize: 17,
                      letterSpacing: 0,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
