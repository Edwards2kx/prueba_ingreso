import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ingreso/ui/pages/users/widgets/user_card_widget.dart';
import 'package:prueba_ingreso/ui/widgets/refresh_button.dart';
import '../../../../domain/entities/user.dart';
import '../../../../data/repositories/users_provider.dart';

class UserListBody extends StatefulWidget {
  final List<User> usersList;
  const UserListBody(this.usersList, {super.key});

  @override
  State<UserListBody> createState() => _UserListBodyState();
}

class _UserListBodyState extends State<UserListBody> {
  List<User> usersList = [];
  List<User> filteredUsers = [];
  @override
  void initState() {
    usersList = widget.usersList;
    filteredUsers = widget.usersList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UserProvider>(context);
    return Column(
      children: [
        _buildTextField(context),
        const SizedBox(height: 12),
        usersList.isNotEmpty
            ? _buildUserList()
            : Expanded(
                child: RefreshButton(callback: () async {
                  usersList = await usersProvider.getUsers();
                  setState(() => filteredUsers = usersList);
                }),
              ),
      ],
    );
  }

  Expanded _buildUserList() {
    return Expanded(
      child: filteredUsers.isEmpty
          ? const Center(
              child: Text('List in empty'),
            )
          : ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return UserCard(filteredUsers[index]);
              },
            ),
    );
  }

  TextField _buildTextField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Buscar usuario',
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
      ),
      onChanged: (String query) {
        setState(() {
          filteredUsers = usersList.where((user) {
            final userName = user.name.toLowerCase();
            return userName.contains(query.toLowerCase());
          }).toList();
        });
      },
    );
  }
}
