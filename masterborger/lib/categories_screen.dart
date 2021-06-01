import 'package:flutter/material.dart';
import 'package:masterborger/dummy_data.dart';

import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 20,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (e) => CategoryItem(
                color: e.color,
                title: e.title,
              ),
            )
            .toList(),
      ),
    );
  }
}
