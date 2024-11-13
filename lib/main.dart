import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../screens/log_in_page.dart';
import '../screens/main_chat_Screen.dart';
import '../screens/reset_password.dart';
import '../screens/sign_up_page.dart';
import '../screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges()
          , builder: (context, snapshot) {
            if(snapshot.data != null){
              return MainChatScreen();
            }else{
              return WelcomeScreen();
            }
          },
      ),
    );
  }
}
