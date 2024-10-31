import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:nhzchatapp/constant.dart';
import 'components/background_container_decoration.dart';
import 'components/custom_button.dart';
import 'components/custom_text_form_field.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

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
            BackgroundContainerDecoration(),
            Center(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal:  9.0),
                shrinkWrap: true,
                children: [
                  Image.asset(height: 175, width: 175, "assets/images/icon.png"),
                  SizedBox(
                    height: 36,
                  ),
                  CustomButton(
                      gradient: kDarkGradient,
                      width: phoneScreenWidth, title: "Log in", onPressed: () {}),
                  SizedBox(
                    height: 18,
                  ),
                  CustomButton(
                      gradient: kLightGradient,
                      width: phoneScreenWidth,
                      title: "Sign Up",
                      onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
