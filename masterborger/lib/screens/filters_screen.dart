import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _vegan = false;
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
          title: Text(
        "Filter recipes that contain",
        textAlign: TextAlign.center,
      )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Lactose-free'),
              value: _lactoseFree,
              onChanged: (bool value) {
                setState(() {
                  _lactoseFree = value;
                });
              },
              secondary: const Icon(Icons.lightbulb_outline),
            ),
            SwitchListTile(
              title: const Text('Gluten-free'),
              value: _glutenFree,
              onChanged: (bool value) {
                setState(() {
                  _glutenFree = value;
                });
              },
              secondary: const Icon(Icons.lightbulb_outline),
            ),
            SwitchListTile(
              title: const Text('Vegan'),
              value: _vegan,
              onChanged: (bool value) {
                setState(() {
                  _vegan = value;
                });
              },
              secondary: const Icon(Icons.lightbulb_outline),
            ),
            SwitchListTile(
              title: const Text('Vegetarian'),
              value: _vegetarian,
              onChanged: (bool value) {
                setState(() {
                  _vegetarian = value;
                });
              },
              secondary: const Icon(Icons.lightbulb_outline),
            ),
          ],
        ),
      ),
    );
  }
}
