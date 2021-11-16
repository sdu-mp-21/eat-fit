final String tableRecipes = 'recipes';

class RecipesFields {
  static final List<String> values = [
    id, name, ingredients, time, cooking
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String ingredients = 'ingredients';
  // static final String imagePath = 'imagePath';
  static final String time = 'time';
  static final String cooking = 'cooking';
}

class Recipes {

  final int? id;
  final String? name;
  final String? ingredients;
  // final String? imagePath;
  final String? time;
  final String? cooking;

  const Recipes({this.id, required this.name, required this.ingredients, required this.time, required this.cooking});

  static Recipes fromJson(Map<String, Object?> json) => Recipes(
    id: json[RecipesFields.id] as int?,
    name: json[RecipesFields.name] as String?,
    ingredients: json[RecipesFields.ingredients] as String?,
    // imagePath: json[RecipesFields.imagePath] as String?,
    time: json[RecipesFields.time] as String?,
    cooking: json[RecipesFields.cooking] as String?,
  );

  Recipes copy({
    int? id,
    String? name,
    String? ingredients,
    // String? imagePath,
    String? time,
    String? cooking,
  }) => Recipes(
    id: id ?? this.id,
    name: name ?? this.name,
    ingredients: ingredients ?? this.ingredients,
    // imagePath: imagePath ?? this.imagePath,
    time: time ?? this.time,
    cooking: cooking ?? this.cooking,
  );

  Map<String, Object?> toJson() => {
    RecipesFields.id: id,
    RecipesFields.name: name,
    RecipesFields.ingredients: ingredients,
    // RecipesFields.imagePath: imagePath,
    RecipesFields.time: time,
    RecipesFields.cooking: cooking,
  };
}