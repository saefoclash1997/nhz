import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nhzchatapp/constant.dart';

class MySpinner extends StatelessWidget {
  const MySpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade400,
              kBlueFour,
            ],
            transform: GradientRotation(-135.0 / 2),
          ),
        ),
        child: Center(
            child: SpinKitSpinningLines(
              lineWidth: 9,
              size: 120,
          color: Colors.white,
        )));
  }
}
