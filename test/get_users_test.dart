import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_ingreso/domain/entities/user.dart';
import 'package:prueba_ingreso/data/repositories/users_provider.dart';

void main() {
  test('pbtener usuarios desde http ', () async {
    List<User> usersList = await UserProvider().getUsersFromServer();
    expect(usersList[0].name, 'Leanne Graham');
    expect(usersList[0].company?.name, 'Romaguera-Crona');
  });
}
