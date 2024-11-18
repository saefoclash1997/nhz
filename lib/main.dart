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
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.light().copyWith(
        appBarTheme:AppBarTheme(
          iconTheme: ThemeData().iconTheme.copyWith(color: Colors.white),
          backgroundColor: Colors.blue.shade700,
          elevation: 12.0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(18.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue.shade400,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: BorderSide(
              color: Colors.blue.shade700,
              width: 3,
            ),
          ),
        )
      ),
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