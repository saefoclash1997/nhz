import 'package:flutter/material.dart';
import '../constant.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.width,
    this.height = 56,
    required this.title,
    required this.onPressed,
    required this.gradient
  });

  final double width;
  final double height;
  final String title;
  void Function()? onPressed;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 2 / 3,
      height: height,
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
        gradient: gradient,
        borderRadius: BorderRadius.circular(360),
      ),
    );
  }
}
