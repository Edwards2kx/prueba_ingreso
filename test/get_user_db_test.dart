
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_ingreso/data/entities/user.dart';
import 'package:prueba_ingreso/providers/database_config.dart';
import 'package:prueba_ingreso/providers/users_provider.dart';
import 'package:sqflite/sqlite_api.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  test('obtener usuarios desde base de datos ', () async {
    Database db = await LocalDataBase.instance.database;

    List<User> usersList = await UserProvider().getUsers();
    //usersList.forEach((e) => print(e.name),);
    //List<User> usersList = UserProvider().userListFromJson(usersGetResponse);
    expect(usersList[0].name, 'Leanne Graham');
    // expect(usersList[0].company?.name, 'Romaguera-Crona');
    // expect(usersList[0].address?.geo, {"lat": "-37.3159", "lng": "81.1496"});
    // // expect(usersList[0].name, 'Leanne Graham');
  });
}
