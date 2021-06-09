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
        actions: <Widget>[
          ElevatedButton(
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).popUntil(
              ModalRoute.withName('/'),
            ),
          ),
        ],
        title: Text('${meal.title}'),
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
              Column(
                children: meal.ingredients
                    .map(
                      (e) => Card(
                        margin: EdgeInsets.all(3),
                        elevation: 5,
                        child: Container(
                          height: 50,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Text('- $e', style: Theme.of(context).textTheme.headline6),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              buildSectionTitle('Steps', context),
              Column(
                children: meal.steps
                    .map(
                      (e) => Card(
                        margin: EdgeInsets.all(3),
                        elevation: 5,
                        child: Expanded(
                          child: Container(
                            height: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    child: Text('#${meal.steps.indexOf(e)}'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                      child: Text(e,
                                          textAlign: TextAlign.justify, style: Theme.of(context).textTheme.headline6)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
              // buildContainer(
              //     ListView.builder(
              //       itemBuilder: (ctx, idx) => Column(
              //         children: [
              //           ListTile(
              //             leading: CircleAvatar(
              //               child: Text('#${idx + 1}'),
              //             ),
              //             title: Text(meal.steps[idx]),
              //           ),
              //           Divider(
              //             height: 8,
              //           ),
              //         ],
              //       ),
              //       itemCount: meal.steps.length,
              //     ),
              //     context),
            ],
          ),
        ),
      ),
    );
  }
}
