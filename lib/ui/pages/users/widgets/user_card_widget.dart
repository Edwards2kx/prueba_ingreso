import 'package:flutter/material.dart';
import 'package:prueba_ingreso/ui/pages/user_post/user_post_page.dart';

import '../../../../domain/entities/user.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: user.name,
              child: Text(
                user.name,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Row(
              children: [
                Icon(Icons.phone, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8.0),
                Text(user.phone, style: const TextStyle(fontSize: 12.0)),
              ],
            ),
            Row(
              children: [
                Icon(Icons.mail, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8.0),
                Text(user.email, style: const TextStyle(fontSize: 12.0)),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => PostsPage(user)));
                },
                child: Text(
                  'VER PUBLICACIONES',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
