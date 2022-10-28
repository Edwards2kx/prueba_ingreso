import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_ingreso/data/entities/user.dart';
import 'package:prueba_ingreso/providers/users_provider.dart';

void main() {
  
  test('pbtener usuarios desde http ', () async {
    List<User> usersList = await UserProvider().getUsers();
    //usersList.forEach((e) => print(e.name),);
    //List<User> usersList = UserProvider().userListFromJson(usersGetResponse);
    expect(usersList[0].name, 'Leanne Graham');
    expect(usersList[0].company?.name, 'Romaguera-Crona');
  //  expect(usersList[0].address.geo, {"lat": "-37.3159", "lng": "81.1496"});
    // expect(usersList[0].name, 'Leanne Graham');
  });
}
