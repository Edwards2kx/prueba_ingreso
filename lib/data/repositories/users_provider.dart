import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba_ingreso/data/services/database_service.dart';
import 'package:prueba_ingreso/domain/entities/user.dart';
import 'package:prueba_ingreso/domain/repositories/abstract_getusers.dart';
import 'package:prueba_ingreso/data/services/database_config.dart';

class UserProvider extends ChangeNotifier implements AbstractUsers {
  List<User> _usersList = [];

  Future<List<User>> getUsersFromServer() async {
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
    return DataBaseService.getUsers();
  }

  Future<void> _insertUsers(List<User> users) async {
    DataBaseService.saveDataBase('users', users);
  }

  @override
  Future<List<User>> getUsers() async {
    if (_usersList.isNotEmpty) return _usersList;
    var data = await _getUsersFromLocal();
    if (data.isNotEmpty) {
      _usersList = data;
      notifyListeners();
      return _usersList;
    }

    data = await getUsersFromServer();
    if (data.isNotEmpty) {
      _usersList = data;
      notifyListeners();
      return _usersList;
    }
    return _usersList;
  }

//para propositos de pruebas, se borran los datos locales para volver a consumir servicio
  Future<void> deleteUsers() async {
    final db = await LocalDataBase.instance.database;
    await db.delete('users');
    await db.delete('posts');
  }

//solo para correr test
  List<User> userListFromJson(String str) =>
      List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
}
