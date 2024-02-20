import 'dart:async';
import 'package:hapind/model/choice.dart';
import 'package:hapind/service/choice_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = 'dating.db';
  static const _databaseVersion = 1;
  final _choiceService = ChoiceService();

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;


  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE purpose (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');
  }

  Future<void> insertPurpose(List<Choice> choices) async {
  Database db = await instance.database;
  for (Choice choice in choices) {
    await db.insert(
      'purpose',
      choice.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

  // Future<void> insertPurpose(String name) async {
  //   Database db = await instance.database;
  //   await db.insert(
  //     'purpose',
  //     {'name': name},
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }

  Future<List<Map<String, dynamic>>> getPurpose() async {
    Database db = await instance.database;
    return await db.query('purpose');
  }

//   Future<void> _fetchPurposeChoice() async {
//   try {
//     final purpose = await _choiceService.getPurposeChoice();
//     if (purpose != null) {
//       await DatabaseHelper.instance.insertPurpose(purpose.name!);
//     }
//   } catch (error) {
//     print('Error fetching purpose choices: $error');
//   }
// }

}
