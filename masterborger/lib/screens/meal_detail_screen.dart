import 'package:flutter/material.dart';
import 'package:masterborger/dummy_data.dart';
import 'package:masterborger/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meals_detail_screen";
  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black),
      ),
    );
  }

  Widget buildContainer(Widget child, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height / 4,
        width: double.infinity,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final Meal meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).popUntil(ModalRoute.withName('/')),
        child: Icon(Icons.home),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle('Ingredients', context),
              buildContainer(
                  ListView.builder(
                    itemBuilder: (ctx, idx) => Card(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        meal.ingredients[idx],
                        style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    itemCount: meal.ingredients.length,
                  ),
                  context),
              buildSectionTitle('Steps', context),
              buildContainer(
                  ListView.builder(
                    itemBuilder: (ctx, idx) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('#${idx + 1}'),
                          ),
                          title: Text(meal.steps[idx]),
                        ),
                        Divider(
                          height: 8,
                        ),
                      ],
                    ),
                    itemCount: meal.steps.length,
                  ),
                  context),
            ],
          ),
        ),
      ),
    );
  }
}
