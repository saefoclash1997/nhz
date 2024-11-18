import 'package:flutter/material.dart';
import '../components/neon_icon.dart';

import '../constant.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    required this.textEditingController,
    required this.title,
    this.isPassword = false,
    this.isEmail = false,
    this.validator
  });

  final TextEditingController textEditingController;
  final String title;
  final bool isPassword;
  final bool isEmail;
  String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isChecked = true;
  void toggleIcon (){
    isChecked = !isChecked;
    print(isChecked);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:widget.validator ,
      obscureText: widget.isPassword ? isChecked : false,
      controller: widget.textEditingController,
      keyboardType: widget.isPassword
          ? TextInputType.text
          : widget.isEmail
              ? TextInputType.emailAddress
              : TextInputType.text,
      decoration: InputDecoration(
        label: Text(widget.title),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: ()=> toggleIcon ()
                ,
                icon: isChecked
                    ? NeonIcon(icon: Icons.visibility_off)
                    : NeonIcon(icon: Icons.visibility),
              )
            : null,
        labelStyle: TextStyle(
          color: Colors.blue.shade700,
        ),

      ),
    );
  }
}
