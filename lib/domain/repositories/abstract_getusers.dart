
import '../entities/user.dart';

abstract class AbstractUsers {

  Future<List<User>> getUsers();
}