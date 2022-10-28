import 'package:flutter/material.dart';
import '../../../../data/entities/user.dart';

class StickyUserContainer extends StatelessWidget {
  final User user;
  const StickyUserContainer(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 6),
      child: Material(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
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
              Text(user.phone),
              Text(user.email),
            ],
          ),
        ),
      ),
    );
  }
}
