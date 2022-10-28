import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


//singleton de almacenamiento local
class LocalDataBase {
  static final LocalDataBase instance = LocalDataBase._init();
  static Database? _database;

  LocalDataBase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('local_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, username TEXT, email TEXT, phone TEXT, website TEXT, address TEXT , company TEXT)');
    await db.execute(
        'CREATE TABLE posts(id INTEGER PRIMARY KEY, userId INTEGER, title TEXT, body TEXT)');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
