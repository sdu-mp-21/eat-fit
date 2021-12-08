import 'package:flutter_team_project/models/person.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PersonDatabase {
  static final PersonDatabase instance = PersonDatabase._init();

  static Database? _database;

  PersonDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('person.db');
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
CREATE TABLE $tablePerson (
  ${PersonFields.id} $idType,
  ${PersonFields.name} $textType,
  ${PersonFields.goal} $textType, 
  ${PersonFields.age} $textType, 
  ${PersonFields.bmi} $textType,
  ${PersonFields.height} $textType,
  ${PersonFields.weight} $textType,
  ${PersonFields.imagePath} $textType
  )
''');
  }

  Future<Person> create(Person person) async {
    final db = await instance.database;
    final id = await db!.insert(tablePerson, person.toJson());
    return person.copy(id: id);
  }

  Future<Person> readPerson(int id) async {
    final db = await instance.database;
    final maps = await db!.query(
      tablePerson,
      columns: PersonFields.values,
      where: '${PersonFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Person.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Person>> readAllPerson() async {
    final db = await instance.database;
    final orderBy = '${PersonFields.id} ASC';
    final result = await db!.query(tablePerson, orderBy: orderBy);
    return result.map((json) => Person.fromJson(json)).toList();
  }

  Future<int> update(Person recipe) async {
    final db = await instance.database;
    return db!.update(
      tablePerson,
      recipe.toJson(),
      where: '${PersonFields.id} = ?',
      whereArgs: [recipe.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db!.delete(
      tablePerson,
      where: '${PersonFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db!.close();
  }
}