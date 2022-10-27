import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ingreso/providers/users_provider.dart';
import 'package:prueba_ingreso/ui/pages/users/widgets/user_card_widget.dart';

import '../../../data/entities/user.dart';
import '../../widgets/custom_appbar.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UserProvider>(context);
    //final List<User> usersList = usersProvider.getUsers();

    return Scaffold(
      appBar: customAppBar,
      body: Padding(
        
        padding: const EdgeInsets.fromLTRB(8, 6, 8, 0),
        child: FutureBuilder(
          future: usersProvider.getUsers(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {            
            if (snapshot.hasData) {
              List<User> userList = snapshot.data;
              
              return Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(hintText: 'Buscar usuario'),
                    onChanged: (t){


                    },
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return  UserCard(userList[index]);
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text('Cargando datos por favor espere....'),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
