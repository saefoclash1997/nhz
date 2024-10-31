import 'package:flutter/material.dart';
import 'package:nhzchatapp/welcome_screen.dart';

void main() =>
  runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}