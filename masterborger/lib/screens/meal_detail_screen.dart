import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meals_detail_screen";
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('meal id'),
      ),
      body: Text('$mealId'),
    );
  }
}
