import 'package:denemeuygulama/screens/categories_screen.dart';
import 'package:denemeuygulama/screens/home_screen.dart';
import 'package:denemeuygulama/screens/register_screen.dart';
import 'package:denemeuygulama/screens/words_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'English Learn App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: LoginView(),
    );
  }
}