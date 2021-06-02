import 'package:flutter/material.dart';
import 'package:masterborger/models/meal.dart';

class MealItem extends StatelessWidget {
  final int duration;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;

  void selectMeal() {}

  const MealItem(
      {Key? key,
      required this.duration,
      required this.title,
      required this.imageUrl,
      required this.complexity,
      required this.affordability})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
