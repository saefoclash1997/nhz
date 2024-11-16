import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:nhzchatapp/authentication.dart';
import 'package:nhzchatapp/components/spinner.dart';
import 'package:nhzchatapp/screens/main_chat_Screen.dart';
import '../constant.dart';
import '../components/background_container_decoration.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "signUpScreen";

  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  signUp(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      setState(() {
        isLoading = true;
      });
      try {
        var  auth = await FirebaseServices().signUp(emailController.text, passwordController.text);
        if(auth!=null){
          setState(() {
            isLoading = false;
          });
          Navigator.pushNamedAndRemoveUntil(context, MainChatScreen.id, (route)=>
          false,
          );
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoading = false;
        });
        if(e.code == 'email-already-in-use'){
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: 'Error',
            desc: 'Email Already in Use',

            btnOkOnPress: () {},
          ).show();
        }else if(e.code == 'invalid-email'){
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: 'Error',
            desc: 'Wrong Email',
            btnOkOnPress: () {},
          ).show();
        }else{
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: 'Error',
            desc: 'Try again later',
            btnOkOnPress: () {},
          ).show();
        }
        print(e.code);
        //email-already-in-use
        //invalid-email
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double phoneScreenWidth = MediaQuery.of(context).size.width;
    double phoneScreenHeight = MediaQuery.of(context).size.height;
    return isLoading? MySpinner() : Scaffold(
      body: SizedBox(
        width: phoneScreenWidth,
        height: phoneScreenHeight,
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Hero(tag: 'bg', child: BackgroundContainerDecoration()),
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
                                "assets/images/icon.png")),
                        NeonText(
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
                        validator: (val) {
                          if(val!.isEmpty){
                            return "Enter your Name";
                          }
                          return null;
                        },
                        textEditingController: nameController,
                        title: "Name",
                        isEmail: true,
                        isPassword: false),
                    SizedBox(
                      height: 18.0,
                    ),
                    CustomTextFormField(
                        validator: (val) {
                          if(val!.isEmpty){
                            return "Enter your Email";
                          }
                          return null;
                        },
                        textEditingController: emailController,
                        title: "Email",
                        isEmail: true,
                        isPassword: false),
                    SizedBox(
                      height: 18.0,
                    ),
                    CustomTextFormField(
                      validator: (val) {
                        if(val!.isEmpty){
                          return "Enter your Password";
                        }
                        return null;
                      },
                      textEditingController: passwordController,
                      title: "Password",
                      isEmail: false,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    CustomTextFormField(
                      validator: (val) {
                        if(val!.isEmpty){
                          return "Enter your Password";
                        }else if(val.length <6){
                          return "Weak Password";
                        }
                        return null;
                      },
                      textEditingController: confirmPasswordController,
                      title: "Confirm Password",
                      isEmail: false,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    Center(
                      child: Hero(
                        tag: 'SignUpButton',
                        child: CustomButton(
                            gradient: kLightGradient,
                            width: phoneScreenWidth,
                            title: "Sign Up",
                            onPressed: () async {
                              signUp(context);

                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
