

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataBase{

  static final LocalDataBase instance = LocalDataBase._init();
  static Database? _database;

  LocalDataBase._init();


Future<Database> get database async {
  if(_database != null)
    {      
      return _database!;
    }

    _database = await _initDB('local_database.db');
    return _database!;
}


  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);
    return await openDatabase(path, version: 1 , onCreate: _createDB);
    // return await openDatabase(path, version: 1 , onCreate: _createDB , onOpen: _openDB);
  }

  // Future _openDB(Database db) async {
  //  print('se abrio la base de datos');
  //  await _dropTableIfExistThenReCreate(db);

  // }

  Future _createDB(Database db, int version)async {
    await db.execute('CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, username TEXT, email TEXT, phone TEXT, website TEXT, address TEXT , company TEXT)');
    await db.execute('CREATE TABLE posts(id INTEGER PRIMARY KEY, userId INTEGER, title TEXT, body TEXT)');
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }

  // Future deleteDB() async {
  //   final dbPath = await getDatabasesPath();
  //   final path = join(dbPath,'local_database.db');
  //   databaseFactory.deleteDatabase(path);
  //   //final db = await instance.database;
    
  //   print('se elimina base de datos users');
  // }

  // Future<void> _dropTableIfExistThenReCreate(Database db) async {
  //   //final db = await instance.database;
  //   await db.execute('DROP TABLE IF EXISTS test');
  //   await db.execute('CREATE TABLE test(id INTEGER, name TEXT)');
  //   await db.insert('test', {'id': 100 , 'name' : "el nombre"});
  //   await db.insert('test', {'id': 200 , 'name' : "el nombre 2"});
  //   var response = await db.query('test');
  //   print('response $response');
  // }

  // final database = openDatabase(
  //   join(await getDatabasesPath(), 'local_database.db'),
  //   onCreate: ((db, version) {
  //     return db.execute(
  //       'CREATE TABLE users( id INTEGER PRIMARY KEY, name TEXT, username TEXT, email TEXT, phone TEXT, website TEXT, address TEXT , company TEXT)',
  //     );
  //   }),
  //   version: 1,
  // );



}