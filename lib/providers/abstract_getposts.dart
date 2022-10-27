import 'package:prueba_ingreso/data/entities/post.dart';

abstract class AbstractPost {
  Future<List<Post>> getPostsByUser(int id);
}