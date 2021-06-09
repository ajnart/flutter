import 'package:flutter/material.dart';
import 'package:masterborger/models/meal.dart';
import 'package:masterborger/screens/categories_screen.dart';
import 'package:masterborger/screens/filters_screen.dart';

import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  const TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages = [];

  @override
  void initState() {
    _pages = [
      CategoriesScreen(),
      FavoritesScreen(widget.favouriteMeals),
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ElevatedButton(
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            // The ^ is kinda awesome
            onPressed: () => _selectPage(_selectedPageIndex ^ 1),
          ),
        ],
        title: Text(_pages.elementAt(_selectedPageIndex).toString().split('Screen')[0]),
      ),
      body: _pages.elementAt(_selectedPageIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          FiltersScreen.routeName,
          arguments: {},
        ),
        tooltip: 'Filter',
        child: Icon(Icons.search),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
