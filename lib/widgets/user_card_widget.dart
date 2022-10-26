import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      //margin: const EdgeInsets.symmetric(vertical: 2.0),
      //padding: const EdgeInsets.all(12.0),
      child: Card(
        child: Container(
          //margin: const EdgeInsets.symmetric(vertical: 2.0),
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Leanne Graham'),
              Row(
                children: const [
                  Icon(Icons.phone),
                  Text('1-770-736-8031 x56442'),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.mail),
                  Text('Sincere@april.biz'),
                ],
              ),           
              TextButton(onPressed: () {}, child: const Text('VER PUBLICACIONES'))
            ],
          ),
        ),
      ),
    );
  }
}
