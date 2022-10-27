import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ingreso/providers/post_providers.dart';
import 'package:prueba_ingreso/ui/widgets/custom_appbar.dart';
import '../../../data/entities/post.dart';
import '../../../data/entities/user.dart';

class PostsPage extends StatelessWidget {
  final User user;
  const PostsPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: customAppBar,
      body: FutureBuilder(
        future: postProvider.getPostsByUser(user.id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          
          if (snapshot.hasData) {
            List<Post> postList = snapshot.data;
            return Column(
              children: [

                Text(user.name),
                Text(user.email),
                Text(user.phone),

                Expanded(
                  child: ListView.builder(
                    
                    itemCount: postList.length,
                    itemBuilder: (BuildContext context, int index) { 
                    return Text(postList[index].title);
                
                   },),
                ),
              ],
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Cargando datos'),
                  CircularProgressIndicator()
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
