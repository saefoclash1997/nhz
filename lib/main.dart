import 'package:flutter/material.dart';
import 'package:nhzchatapp/log_in_page.dart';

void main() =>
  runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}