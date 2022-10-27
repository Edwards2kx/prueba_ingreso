import 'package:flutter/material.dart';
import 'package:prueba_ingreso/providers/post_providers.dart';
import 'package:prueba_ingreso/providers/users_provider.dart';
import 'package:prueba_ingreso/ui/pages/users/users_list_page.dart';

import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => PostProvider())
      ],
      child: MaterialApp(
          title: 'Prueba Ingreso',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
            primaryColor: const Color(0xFF2C6133),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF2C6133),
            ),
          ),
          home: const UsersListPage()),
    );
  }
}
