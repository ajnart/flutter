// ignore: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import './constants.dart';
import 'social_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Apps',
      theme: ThemeData(primarySwatch: Colors.blue, visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String socialName = "Flutter Apps";
  String description = "This repository is a collection of the flutter apps I've built.\n"
      "Click on any cards bellow to view its deployment !";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterLogo(
                        size: 80,
                      ),
                      Text(
                        socialName,
                        style: normalText(
                          //color: textColor,
                          fontSize: 27,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: normalText(
                      color: textColor, fontSize: 16, fontWeight: FontWeight.w400, height: 1.5, letterSpacing: 0),
                ),
                const SizedBox(
                  height: 30,
                ),
                Wrap(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SocialCard(
                          url: '/projects/linktree',
                          asset: './assets/linktree.png',
                          label: "Link Tree",
                          description: "A LinkTr.ee clone"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SocialCard(
                          url: '/projects/managment',
                          asset: 'assets/managment.png',
                          label: "Managment mockup",
                          description: "Experimenting with mockups in the form of a deshboard UI"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SocialCard(
                        url: '/projects/quizz',
                        description: "My first project! A simple quizz app with a darkmode switch",
                        label: "Quizz",
                        asset: 'assets/quizz.png',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
