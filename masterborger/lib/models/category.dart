import 'package:flutter_svg/svg.dart';

class Category {
  final String id;
  final String title;
  final SvgPicture svg;

  Category({
    required this.id,
    required this.svg,
    required this.title,
  });
}
