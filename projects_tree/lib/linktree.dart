// ignore: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:js' as js;
import './constants.dart';
import 'social_card.dart';

class LinkTree extends StatefulWidget {
  @override
  _LinkTreeState createState() => _LinkTreeState();
}

class _LinkTreeState extends State<LinkTree> {
  String socialName = "Flutter Apps";
  String description = "This repository is a collection of the flutter apps I've built.\n"
      "Click on any cards bellow to view its deployment !";
  static List<Project> projects = [
    Project(
        url: '/flutter/linktree/',
        asset: './assets/linktree.png',
        label: "Link Tree",
        date: DateTime(2021, 5, 30),
        description: "A Linktr.ee clone, it provides a simple onepage for all your social media links!"),
    Project(
      url: '/flutter/expenses_app/',
      description: "A small app that tracks your weekly expenses.",
      label: "Expenses",
      asset: 'assets/expenses_app.png',
      date: DateTime(2021, 5, 30),
    ),
    Project(
        url: '/flutter/managment_mockup/',
        asset: 'assets/managment.png',
        label: "Managment mockup",
        description: "Experimenting with mockups in the form of a deshboard UI seen in a YouTube video about flutter"),
    Project(
      url: '/flutter/masterborger/',
      description: "An application containing recipes for different types of food, sorted by categories.",
      label: "Cooking ideas!",
      asset: 'assets/masterborger.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () => js.context.callMethod('open', ['https://github.com/ajnart/flutter']),
        label: Text(
          "GitHub",
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          MdiIcons.github,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: MainInfoWidget(
          socialName: socialName,
          description: description,
          controller: controller,
          projects: projects,
        ),
      ),
    );
  }
}

class MainInfoWidget extends StatelessWidget {
  const MainInfoWidget({
    Key? key,
    required this.socialName,
    required this.description,
    required this.controller,
    required this.projects,
  }) : super(key: key);

  final String socialName;
  final String description;
  final PageController controller;
  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(
                    size: 60,
                  ),
                  Text(
                    socialName,
                    style: normalText(
                      fontSize: 27,
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
              style: normalText(fontSize: 16, fontWeight: FontWeight.w400, height: 1.5, letterSpacing: 0),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 16),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: PageView(
                      controller: controller,
                      scrollBehavior: ScrollBehavior(),
                      allowImplicitScrolling: false,
                      children: projects
                          .map((e) => Container(
                                  child: SocialCard(
                                url: e.url,
                                asset: e.asset,
                                label: e.label,
                                date: e.date,
                                description: e.description,
                              )))
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    child: SmoothPageIndicator(
                      controller: controller,
                      onDotClicked: (e) => controller.page,
                      count: projects.length,
                      effect: WormEffect(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Project {
  final String url;
  final String asset;
  final String label;
  final DateTime? date;
  final String description;

  Project({
    required this.url,
    required this.asset,
    required this.label,
    required this.description,
    this.date,
  });
}
