import 'package:flutter_team_project/models/recipes.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RecipesDatabase {
  static final RecipesDatabase instance = RecipesDatabase._init();

  static Database? _database;

  RecipesDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('recipes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableRecipes (
  ${RecipesFields.id} $idType,
  ${RecipesFields.name} $textType,
  ${RecipesFields.ingredients} $textType, 
  ${RecipesFields.time} $textType, 
  ${RecipesFields.cooking} $textType
  )
''');
  }

  Future<Recipes> create(Recipes recipe) async {
    final db = await instance.database;
    final id = await db!.insert(tableRecipes, recipe.toJson());
    return recipe.copy(id: id);
  }

  Future<Recipes> readRecipe(int id) async {
    final db = await instance.database;
    final maps = await db!.query(
      tableRecipes,
      columns: RecipesFields.values,
      where: '${RecipesFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Recipes.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Recipes>> readAllRecipes() async {
    final db = await instance.database;
    final orderBy = '${RecipesFields.id} ASC';
    final result = await db!.query(tableRecipes, orderBy: orderBy);
    return result.map((json) => Recipes.fromJson(json)).toList();
  }

  Future<int> update(Recipes recipe) async {
    final db = await instance.database;
    return db!.update(
      tableRecipes,
      recipe.toJson(),
      where: '${RecipesFields.id} = ?',
      whereArgs: [recipe.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db!.delete(
      tableRecipes,
      where: '${RecipesFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db!.close();
  }
}