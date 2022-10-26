import 'package:flutter/material.dart';
import 'package:prueba_ingreso/widgets/user_card_widget.dart';

import '../widgets/custom_appbar.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8,6,8,0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Buscar usuario'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) { 
                return const UserCard();
               },),
            ),
          ],
          
        ),
      ),
    );
  }
}
