import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prueba_ingreso/data/entities/post.dart';
import 'package:prueba_ingreso/providers/abstract_getposts.dart';
import 'package:http/http.dart' as http;

class PostProvider with ChangeNotifier implements AbstractPost {
//HttpPostProvider
  @override
  Future<List<Post>> getPostsByUser(int id) async {
    final String url = 'https://jsonplaceholder.typicode.com/posts?userId=$id';
    //final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?userId=$id'));
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var postList = List<Post>.from(jsonResponse.map((x) => Post.fromJson(x)));
      return postList;
    } else {
      throw Exception('Failed to load Post');
      //return null;
    }
  }
}
