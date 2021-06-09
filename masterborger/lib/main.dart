import 'package:flutter/material.dart';
import 'package:masterborger/screens/filters_screen.dart';
import 'package:masterborger/screens/tabs_sceen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _favouriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex = _favouriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0)
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    else {
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isFavorite(id) {
    return _favouriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          accentColor: Colors.amber,
          primarySwatch: Colors.pink,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(51, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline1: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ))),
      home: TabsScreen(_favouriteMeals),
      routes: {
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
              _toggleFavorite,
              _isFavorite,
            ),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
