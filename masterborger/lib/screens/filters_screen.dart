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
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(title: const Text("Filter recipes that contain", textAlign: TextAlign.center)),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Text('Adjust your filters', style: Theme.of(context).textTheme.headline6),
            SwitchListTile(
              title: const Text('Lactose-free'),
              subtitle: const Text('Only include without lactose'),
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
              subtitle: const Text('Only include without gluten'),
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
              subtitle: const Text('Only include vegan recipes'),
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
              subtitle: const Text('Only include vegetarian recipes'),
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
