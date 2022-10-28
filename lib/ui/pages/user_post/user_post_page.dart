import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ingreso/data/repositories/post_providers.dart';
import 'package:prueba_ingreso/ui/pages/user_post/widgets/post_card_widget.dart';
import 'package:prueba_ingreso/ui/pages/user_post/widgets/sticky_user_widget.dart';
import 'package:prueba_ingreso/ui/widgets/custom_appbar.dart';
import 'package:prueba_ingreso/ui/widgets/refresh_button.dart';
import '../../../domain/entities/post.dart';
import '../../../domain/entities/user.dart';

class PostsPage extends StatefulWidget {
  final User user;
  const PostsPage(this.user, {super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: customAppBar,
      body: Column(
        children: [
          StickyUserContainer(widget.user),
          Expanded(
            child: FutureBuilder(
              future: postProvider.getPostsByUser(widget.user.id),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  List<Post> postList = snapshot.data;
                  return _buildPosts(postList, postProvider);
                } else {
                  return _loading();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Center _loading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Text('Cargando datos'), CircularProgressIndicator()],
      ),
    );
  }

  Widget _buildPosts(List<Post> postList, PostProvider postProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: postList.isNotEmpty
          ? ListView.builder(
              itemCount: postList.length,
              itemBuilder: (BuildContext context, int index) {
                return PostCard(postList[index]);
              },
            )
          : RefreshButton(
              callback: () async {
                await postProvider.getPostsByUser(widget.user.id);
                setState(() {});
              },
            ),
    );
  }
}
