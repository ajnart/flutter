import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final SvgPicture svg;
  final String id;

  const CategoryItem(this.title, this.svg, this.id);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Column(
          children: [
            svg,
            Text(
              title,
              style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
