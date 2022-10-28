import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prueba_ingreso/data/entities/post.dart';
import 'package:prueba_ingreso/providers/abstract_getposts.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_ingreso/providers/database_config.dart';
import 'package:sqflite/sqflite.dart';

class PostProvider with ChangeNotifier implements AbstractPost {

  Future<List<Post>> _getPostsByUserFromServer(int id) async {
    final String url = 'https://jsonplaceholder.typicode.com/posts?userId=$id';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var postList =
            List<Post>.from(jsonResponse.map((x) => Post.fromJson(x)));
        await _insertPosts(postList);
        return postList;
      } else {
        throw Exception('Failed to load Post');
      }
    } catch (e) {
      //si no hay conexion a internet regresa un array vacio
      return [];
    }
  }

  Future<List<Post>> _getPostsByUserFromLocal(int id) async {
    List<Post> listPosts = [];
    Database db = await LocalDataBase.instance.database;
    final List<Map<String, dynamic>> mapPosts =
        await db.query('posts', where: 'userId = ?', whereArgs: [id]);
    for (Map<String, dynamic> mapPost in mapPosts) {
      listPosts.add(Post.fromMap(mapPost));
    }
    return listPosts;
  }

  Future<void> _insertPosts(List<Post> posts) async {
    final db = await LocalDataBase.instance.database;
    for (Post post in posts) {
      await db.insert('posts', post.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  @override
  Future<List<Post>> getPostsByUser(int id) async {
    var data = await _getPostsByUserFromLocal(id);
    if (data.isNotEmpty) {
      print('se usan datos locales del post');
      return data;
    } else {
      return await _getPostsByUserFromServer(id);
    }
  }
}
