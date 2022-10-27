import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prueba_ingreso/providers/abstract_getusers.dart';

import '../data/entities/user.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier implements AbstractUsers {
//HttpUsersProvider
@override
  Future<List<User>> getUsers() async {
    //final response = await HttpService.fetchData('https://jsonplaceholder.typicode.com/users');
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var userList = List<User>.from(jsonResponse.map((x) => User.fromJson(x)));
      return userList;
    } else {
      throw Exception('Failed to load Users');
      //return null;
    }
  }

  List<User> userListFromJson(String str) =>
      List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
}
