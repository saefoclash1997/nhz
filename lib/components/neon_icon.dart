import 'package:neon_widgets/neon_widgets.dart';
import '../constant.dart';
import 'package:flutter/material.dart';

class NeonIcon extends StatelessWidget {
  NeonIcon({required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return NeonContainer(
      borderRadius: BorderRadius.circular(60),
      padding: EdgeInsets.all(3),
      spreadColor: kBlueFour,
      lightBlurRadius: 20,
      lightSpreadRadius: 2,
      borderWidth: 1,
      borderColor: kBlueFour,
      containerColor: Colors.transparent,
      child: Icon(icon,
        color: kBlueFour,
      ),

    ) ;
  }
}
