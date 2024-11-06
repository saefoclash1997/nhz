import 'package:flutter/material.dart';
import 'package:nhzchatapp/screens/log_in_page.dart';
import 'package:nhzchatapp/screens/main_chat_Screen.dart';
import 'package:nhzchatapp/screens/reset_password.dart';
import 'package:nhzchatapp/screens/sign_up_page.dart';
import 'package:nhzchatapp/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LogInPage.id: (context) => LogInPage(),
        SignUpPage.id: (context) => SignUpPage(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        ForgetPasswordPage.id: (context) => ForgetPasswordPage(),
        MainChatScreen.id: (context) => MainChatScreen(),
      },
      initialRoute: WelcomeScreen.id,
      debugShowCheckedModeBanner: false,
    );
  }
}
