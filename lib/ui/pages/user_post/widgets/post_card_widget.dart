
import 'package:flutter/material.dart';
import '../../../../domain/entities/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: TextStyle(
                  fontSize: 16.0, color: Theme.of(context).primaryColor),
            ),
           const Divider(),
            Text(post.body, style: const TextStyle())
          ],
        ),
      ),
    );
  }
}
