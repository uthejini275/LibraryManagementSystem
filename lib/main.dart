import 'package:flutter/material.dart';
import 'screens/login_screen.dart';  // 👈 Import the new screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
      },
// 👈 Just call the screen here
    );
  }
}
