import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_ingreso/data/entities/post.dart';
import 'package:prueba_ingreso/providers/post_providers.dart';

void main() {
  test('obtener posts por usuario desde http ', () async {
    int userId = 1;
    List<Post> postsList = await PostProvider().getPostsByUser(userId);
    expect(postsList[0].userId, 1);
    expect(postsList[0].id, 1);
    expect(postsList[0].title,
        'sunt aut facere repellat provident occaecati excepturi optio reprehenderit');
    expect(postsList[0].body,
        'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto');

    expect(postsList[1].userId, 1);
    expect(postsList[1].id, 2);
    expect(postsList[1].title, 'qui est esse');
    expect(postsList[1].body,
        'est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla');
  });
}
