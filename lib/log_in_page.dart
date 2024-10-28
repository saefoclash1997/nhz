import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:nhzchatapp/constant.dart';
import 'components/background_container_decoration.dart';
import 'components/custom_button.dart';
import 'components/custom_text_form_field.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

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
            BackgroundContainerDecoration(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NeonText(
                    text: "Log in",
                    spreadColor: Colors.blue.shade900,
                    blurRadius: 25,
                    textSize: 48,
                    textColor: Colors.blue.shade400,
                    letterSpacing: 8,
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
                  CustomTextFormField(
                    textEditingController: passwordController,
                    title: "Password",
                    isEmail: false,
                    isPassword: true,
                  ),
                  // Row(
                  //   children: [
                  // Flexible(
                  //   child: CheckboxListTile(value: false, onChanged: (val){},
                  //   title: NeonText(text: "Remember Me",
                  //     textColor: kBlueFour,
                  //     spreadColor: kBlueFour,
                  //     textAlign: TextAlign.left,
                  //     textSize: 14.0,
                  //   ),
                  //     controlAffinity: ListTileControlAffinity.leading,
                  //
                  //   ),
                  // ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: NeonText(
                          text: "Forget Password?",
                          textColor: kBlueFour,
                          spreadColor: kBlueFour,
                          textAlign: TextAlign.left,
                          textSize: 14.0,
                        )),
                  ),
                  //   ],
                  // ),

                  CustomButton(
                    width: phoneScreenWidth,
                    height: 56,
                    title: "Log In",
                    onPressed: () {},
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
