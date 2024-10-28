import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../constant.dart';

class BackgroundContainerDecoration extends StatelessWidget {
  const BackgroundContainerDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    double phoneScreenWidth = MediaQuery.of(context).size.width;
    double phoneScreenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: Container(
            width: min(phoneScreenWidth / 2, phoneScreenHeight / 2),
            height: min(phoneScreenWidth / 2, phoneScreenHeight / 2),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: kCircleShadowColor,
                    blurRadius: 2.5,
                    offset: Offset(0, 5))
              ],
              gradient: kLightGradient,
              borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(360)),
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: Container(
            width: min(phoneScreenWidth * 2 / 3, phoneScreenHeight * 2 / 3),
            height:
            min(phoneScreenWidth * 2 / 3, phoneScreenHeight * 2 / 3),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: kCircleShadowColor,
                    blurRadius: 2.5,
                    offset: Offset(0, 5))
              ],
              gradient: kDarkGradient,
              borderRadius:
              BorderRadius.only(bottomRight: Radius.circular(360)),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: kCircleShadowColor,
                    blurRadius: 2.5,
                    offset: Offset(5, 0))
              ],
              gradient: kLightGradient,
              borderRadius:
              BorderRadius.only(topRight: Radius.circular(360)),
            ),
          ),
        ),
        Positioned(
          right: 40,
          bottom: 80,
          child: Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: kCircleShadowColor,
                    blurRadius: 2.5,
                    offset: Offset(5, 3))
              ],
              gradient: kDarkGradient,
              borderRadius: BorderRadius.circular(360),
            ),
          ),
        ),
      ],
    );
  }
}
