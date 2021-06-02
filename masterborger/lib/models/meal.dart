enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final String title;
  // Lists
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  // Enums
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  final String imageUrl;
  // Booleans
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    required this.id,
    required this.title,
    required this.categories,
    required this.ingredients,
    required this.steps,
    required this.affordability,
    required this.complexity,
    required this.duration,
    required this.imageUrl,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });
}
