


import 'package:flutter/material.dart';

import '../constant.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.onPressed,
  });

  final double width;
  final double height;
  final String title;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 2 / 3,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 28.0),
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: kCircleShadowColor, blurRadius: 2.5, offset: Offset(5, 3))
        ],
        gradient: kDarkGradient,
        borderRadius: BorderRadius.circular(360),
      ),
    );
  }
}
