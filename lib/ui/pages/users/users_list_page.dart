import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ingreso/data/repositories/users_provider.dart';
import 'package:prueba_ingreso/ui/pages/users/widgets/user_list_body.dart';
import '../../../domain/entities/user.dart';
import '../../widgets/custom_appbar.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: customAppBar,
      //para propositos de limpiar la base de datos en pruebas
      // floatingActionButton: FloatingActionButton(
      //     child: const Icon(Icons.delete),
      //     onPressed: () async => usersProvider.deleteUsers()),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 6, 8, 0),
        child: FutureBuilder(
          future: usersProvider.getUsers(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List<User> userList = snapshot.data;
              return UserListBody(userList);
            } else {
              return _waitingDataBuild();
            }
          },
        ),
      ),
    );
  }

  Widget _waitingDataBuild() {
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
}
