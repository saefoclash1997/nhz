import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/log_in_page.dart';
import '../screens/main_chat_Screen.dart';
import '../screens/reset_password.dart';
import '../screens/sign_up_page.dart';
import '../screens/welcome_screen.dart';
import 'components/custom_theme_data.dart';
import 'control/provider_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ToggleTheme()),
      ],
      child: MyApp(

      )));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ToggleTheme>(

      builder: (context, toggleTheme,child) {
        return MaterialApp(
          theme: toggleTheme.isChecked ? ThemeData.dark().copyWith(
            appBarTheme:AppBarTheme(
              iconTheme: ThemeData().iconTheme.copyWith(color: Colors.white),
              backgroundColor: Colors.blue.shade700,
              elevation: 12.0,
            ),
          ) : kLightTheme,
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
      },
    );
  }
}