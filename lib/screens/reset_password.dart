import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import '../constant.dart';
import '../components/background_container_decoration.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  static const String id = "resetPassword";

  ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  bool isClicked = false;

  TextEditingController emailController = TextEditingController();

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
            Hero(tag: 'bg', child: BackgroundContainerDecoration()),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Hero(
                          tag: 'AppImage',
                          child: Image.asset(
                              height: 100,
                              width: 100,
                              "assets/images/icon.png")),
                      Flexible(
                        child: NeonText(
                          text: "Reset Password",
                          spreadColor: Colors.blue.shade400,
                          blurRadius: 25,
                          textSize: 24,
                          textColor: Colors.blue.shade900,
                          letterSpacing: 8,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 36.0,
                  ),
                  CustomTextFormField(
                      textEditingController: emailController,
                      title: "Email",
                      isEmail: true,
                      isPassword: false),
                  SizedBox(
                    height: 18.0,
                  ),

                  GestureDetector(

                    onTap: isClicked ? null : (){
                      setState(() {
                        isClicked=!isClicked;
                      });
                    },
                    child: AnimatedContainer(
                      width: isClicked ? 250 : 175,
                      duration: Duration(seconds: 1),
                      padding: isClicked ? EdgeInsets.all(12.0) :   EdgeInsets.all(18.0),
                      child: isClicked?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.check,
                          size: 32.0,
                            color: Colors.white,
                          ),
                      Text("Sent!",style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                      ),),
                        ],
                      )


                      :Text("Send Code",style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600
                      ),),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: kCircleShadowColor, blurRadius: 2.5, offset: Offset(5, 3))
                        ],
                        borderRadius: isClicked ?  BorderRadius.circular(60) :
                        BorderRadius.circular(15),
                        gradient: isClicked ?  LinearGradient(colors: [
                          Colors.green.shade900,
                          Colors.green.shade500,
                        ]) : kDarkGradient ,
                      ),

                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// GestureDetector(
//   onTap: (){
//     print("Gesture");
//   },
//   child: Container(
//     alignment: Alignment.center,
//     width: phoneScreenWidth*2/3,
//     padding: EdgeInsets.all(18.0),
//     child: Text("Log in",
//     style: TextStyle(
//       color: Colors.white,
//       fontSize: 32.0
//     ),
//     ),
//     decoration: BoxDecoration(
//       boxShadow: [
//         BoxShadow(
//             color: kCircleShadowColor,
//             blurRadius: 2.5,
//             offset: Offset(5, 3))
//       ],
//       gradient: kDarkGradient,
//       borderRadius: BorderRadius.circular(360),
//     ),
//   ),
// ),

// MaterialButton(onPressed: (){},
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(18.0)
//
//   ),
//   child: Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(18),
//       gradient: kDarkGradient
//     ),
//     alignment: Alignment.center,
//       width: phoneScreenWidth*2/3,
//       child: Text("Log in",
//         style: TextStyle(
//             color: Colors.white,
//             fontSize: 26.0
//         ),
//
//       ),
//   ),
//
//
//
//
//
//
//
// ),
// Container(
//   alignment: Alignment.center,
//   width: phoneScreenWidth*2/3,
//   padding: EdgeInsets.all(18.0),
//   child: ElevatedButton(
//     onPressed: (){}, child:
//   Text("Log in",
//     style: TextStyle(
//         color: Colors.white,
//         fontSize: 32.0
//     ),
//   ),),
//   decoration: BoxDecoration(
//     boxShadow: [
//       BoxShadow(
//           color: kCircleShadowColor,
//           blurRadius: 2.5,
//           offset: Offset(5, 3))
//     ],
//     gradient: kDarkGradient,
//     borderRadius: BorderRadius.circular(360),
//   ),
// ),
