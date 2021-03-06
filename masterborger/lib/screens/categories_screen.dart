import 'package:flutter/material.dart';
import 'package:masterborger/dummy_data.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(8),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              catData.title,
              catData.svg,
              catData.id,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
