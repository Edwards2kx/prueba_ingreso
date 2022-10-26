import 'dart:convert';
import '../models/user.dart';

class UserProvider {
  //late String jsonString;
  //late User usuario;
  UserProvider();



  List<User> userListFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
  
}
