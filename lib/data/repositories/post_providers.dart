import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_ingreso/data/services/database_service.dart';
import 'package:prueba_ingreso/domain/entities/post.dart';
import 'package:prueba_ingreso/domain/repositories/abstract_getposts.dart';

class PostProvider with ChangeNotifier implements AbstractPost {
  Future<List<Post>> getPostsByUserFromServer(int id) async {
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
    return DataBaseService.getPosts(id);
  }

  Future<void> _insertPosts(List<Post> posts) async {
    DataBaseService.saveDataBase('posts', posts);
  }

  @override
  Future<List<Post>> getPostsByUser(int id) async {
    var data = await _getPostsByUserFromLocal(id);
    if (data.isNotEmpty) {
      return data;
    } else {
      return await getPostsByUserFromServer(id);
    }
  }
}
