import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prueba_ingreso/providers/abstract_getusers.dart';
import 'package:sqflite/sql.dart';
import '../data/entities/user.dart';
import 'package:http/http.dart' as http;
import 'database_config.dart';

class UserProvider extends ChangeNotifier implements AbstractUsers {
  
  List<User> _usersList = [];

  Future<List<User>> _getUsersFromServer() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var userList =
            List<User>.from(jsonResponse.map((x) => User.fromJson(x)));
        await _insertUsers(userList);
        notifyListeners();
        return userList;
      } else {
        throw Exception('Failed to load Users');
      }
    } catch (e) {
      //retorna vacio si no hay conexion a internet
      return [];
    }
  }

  Future<List<User>> _getUsersFromLocal() async {
    List<User> listUsers = [];
    final db = await LocalDataBase.instance.database;
    final List<Map<String, dynamic>> mapUsers = await db.query('users');
    for (Map<String, dynamic> mapUser in mapUsers) {
      listUsers.add(User.fromMap(mapUser));
    }
    return listUsers;
  }

  Future<void> _insertUsers(List<User> users) async {
    final db = await LocalDataBase.instance.database;
    print(
        'se llama a insertar usuarios en la database ${users.length} usuarios');

    for (User user in users) {
      await db.insert('users', user.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<void> deleteUsers() async {
    final db = await LocalDataBase.instance.database;
    await db.delete('users');
    print('se borran los users');
  }

  @override
  Future<List<User>> getUsers() async {
    print('intentado obtener datos');

    if (_usersList.isNotEmpty) return _usersList;
    var data = await _getUsersFromLocal();
    if (data.isNotEmpty) {
      _usersList = data;
      notifyListeners();
      print('se usan datos locales');
      return _usersList;
    }

    data = await _getUsersFromServer();
    if (data.isNotEmpty) {
      print('se usan datos remotos');
      _usersList = data;
      notifyListeners();
      return _usersList;
    }
    return _usersList;
  }


//solo para correr test
  List<User> userListFromJson(String str) =>
      List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
}
