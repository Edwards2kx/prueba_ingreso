import 'package:prueba_ingreso/domain/entities/post.dart';

abstract class AbstractPost {

  Future<List<Post>> getPostsByUser(int id);
}