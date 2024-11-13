import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../screens/log_in_page.dart';
import '../screens/sign_up_page.dart';
import '../components/background_container_decoration.dart';
import '../components/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcomeScreen";
  WelcomeScreen({super.key});

 static const String _welcomeMessage = 'Welcome To NHZ Chat App';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  Animation? colorTween;
  AnimationController? controller;

  @override
  void initState() {
    controller=AnimationController(vsync: this,
    duration: Duration(seconds: 1)
    );
    colorTween=ColorTween(
      begin: kBlueFour,
      end: ThemeData().scaffoldBackgroundColor
    ).animate(controller!);
    controller!.forward();
    controller!.addListener(
      () => setState(() {
      }),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double phoneScreenWidth = MediaQuery.of(context).size.width;
    double phoneScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colorTween!.value,
      body: SizedBox(
        width: phoneScreenWidth,
        height: phoneScreenHeight,
        child: Stack(
          children: [
            BackgroundContainerDecoration(),
            Center(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 9.0),
                shrinkWrap: true,
                children: [
                  Hero(
                    tag: 'AppImage',
                    child: Image.asset(
                        height: 175, width: 175, "assets/images/icon.png"),

                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          WelcomeScreen._welcomeMessage  ,
                          textStyle: TextStyle(

                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: kBlueFour,
                          ),
                          speed: const Duration(milliseconds: WelcomeScreen._welcomeMessage.length >= 100 ?  100 : 50),
                        ),
                      ],
                      totalRepeatCount:1,

                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Hero(
                    tag: 'logInButton',
                    child: CustomButton(
                        gradient: kDarkGradient,
                        width: phoneScreenWidth,
                        title: "Log in",
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => LogInPage()));

                          Navigator.pushNamed(context, LogInPage.id);
                        }),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Hero(
                    tag: 'SignUpButton',
                    child: CustomButton(
                        gradient: kLightGradient,
                        width: phoneScreenWidth,
                        title: "Sign Up",
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpPage.id);

                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
