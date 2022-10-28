import 'package:prueba_ingreso/domain/entities/post.dart';
import 'package:prueba_ingreso/domain/entities/user.dart';
import 'package:prueba_ingreso/data/services/database_config.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService {
  static saveDataBase(String table, List<dynamic> data) async {
    final db = await LocalDataBase.instance.database;
    for (var obj in data) {
      await db.insert(table, obj.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  static Future<List<User>> getUsers() async {
    List<User> userList = [];
    final db = await LocalDataBase.instance.database;
    final List<Map<String, dynamic>> mapUsers = await db.query('users');
    for (Map<String, dynamic> mapUser in mapUsers) {
      userList.add(User.fromMap(mapUser));
    }
    return userList;
  }

  static Future<List<Post>> getPosts(int id) async {
    List<Post> listPosts = [];
    Database db = await LocalDataBase.instance.database;
    final List<Map<String, dynamic>> mapPosts =
        await db.query('posts', where: 'userId = ?', whereArgs: [id]);
    for (Map<String, dynamic> mapPost in mapPosts) {
      listPosts.add(Post.fromMap(mapPost));
    }
    return listPosts;
  }
}
