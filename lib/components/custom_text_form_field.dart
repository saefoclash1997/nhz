import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:nhzchatapp/components/neon_icon.dart';

import '../constant.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    required this.textEditingController,
    required this.title,
    required this.isPassword,
    required this.isEmail,
  });

  final TextEditingController textEditingController;
  final String title;
  final bool isPassword;
  final bool isEmail;

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
      obscureText: widget.isPassword ? isChecked : false,
      controller: widget.textEditingController,
      keyboardType: widget.isPassword
          ? TextInputType.name
          : widget.isEmail
              ? TextInputType.emailAddress
              : TextInputType.name,
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
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade400,
            width: 1.5,
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
      ),
    );
  }
}
