import 'package:flutter/material.dart';
import 'package:masterborger/models/meal.dart';
import 'package:masterborger/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final int duration;
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;

  void selectMeal(context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  const MealItem({
    Key? key,
    required this.duration,
    required this.title,
    required this.imageUrl,
    required this.complexity,
    required this.affordability,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
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
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 350,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Text(
                      title,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${complexity.toString().substring(11)}'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${affordability.toString().substring(14)}'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
