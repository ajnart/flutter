import 'package:projects_tree/models/project.dart';

List<Project> projects = [
  Project(
      url: '/flutter/linktree/',
      asset: './assets/linktree.png',
      label: "Link Tree",
      description: "A Linktr.ee clone, it provides a simple onepage for all your social media links!"),
  Project(
    url: '/flutter/expenses_app/',
    description: "A small app that tracks your weekly expenses.",
    label: "Expenses",
    asset: 'assets/expenses_app.png',
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
