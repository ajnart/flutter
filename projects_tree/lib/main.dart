// ignore: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:js' as js;
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
      ),
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
  String description =
      "This repository is a collection of the flutter apps I've built.\n"
      "Click on any cards bellow to view its deployment !";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () => js.context.callMethod(
                  'open', ['https://github.com/ajnart/flutter-course']),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.all(3)),
                  Text("GitHub"),
                  Padding(padding: EdgeInsets.all(3)),
                  Icon(MdiIcons.github),
                ],
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.black),
                fixedSize: MaterialStateProperty.all(Size(100, 60)),
              ),
            ),
          ],
        ),
      ),
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
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      letterSpacing: 0),
                ),
                Padding(padding: EdgeInsets.all(8)),
                const SizedBox(
                  height: 30,
                ),
                Wrap(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SocialCard(
                          url: '/flutter-course/linktree/',
                          asset: './assets/linktree.png',
                          label: "Link Tree",
                          description:
                              "A Linktr.ee clone, it provides a simple onepage for all your social media links!"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SocialCard(
                          url: '/flutter-course/managment_mockup/',
                          asset: 'assets/managment.png',
                          label: "Managment mockup",
                          description:
                              "Experimenting with mockups in the form of a deshboard UI seen in a YouTube video about flutter"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SocialCard(
                        url: '/flutter-course/quizz/',
                        description:
                            "My first project! A simple quizz app with a darkmode switch that decides how much you are worth to society",
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