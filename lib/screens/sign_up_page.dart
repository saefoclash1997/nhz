import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import '../constant.dart';
import '../components/background_container_decoration.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';



class SignUpPage extends StatelessWidget {
  static const String id = "signUpScreen";

  SignUpPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double phoneScreenWidth = MediaQuery.of(context).size.width;
    double phoneScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: phoneScreenWidth,
        height: phoneScreenHeight,
        child: Stack(
          children: [
            Hero(
                tag: 'bg',child: BackgroundContainerDecoration()),
            Center(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Hero(
                          tag: 'AppImage',
                          child: Image.asset(
                              height: 100,
                              width: 100,
                              "assets/images/icon.png")),                      NeonText(
                        text: "Sign Up",
                        spreadColor: Colors.blue.shade900,
                        blurRadius: 25,
                        textSize: 48,
                        textColor: Colors.blue.shade400,
                        letterSpacing: 8,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 36.0,
                  ),
                  CustomTextFormField(
                      textEditingController: emailController,
                      title: "Name",
                      isEmail: true,
                      isPassword: false),
                  SizedBox(
                    height: 18.0,
                  ),
                  CustomTextFormField(
                      textEditingController: emailController,
                      title: "Email",
                      isEmail: true,
                      isPassword: false),
                  SizedBox(
                    height: 18.0,
                  ),
                  CustomTextFormField(
                    textEditingController: passwordController,
                    title: "Password",
                    isEmail: false,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  CustomTextFormField(
                    textEditingController: passwordController,
                    title: "Confirm Password",
                    isEmail: false,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Center(
                    child:           Hero(
                      tag: 'SignUpButton',
                      child: CustomButton(
                          gradient: kLightGradient,
                          width: phoneScreenWidth,
                          title: "Sign Up",
                          onPressed: () {

                          }),
                    ),
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