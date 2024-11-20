import 'package:flutter/material.dart';

ThemeData kLightTheme = ThemeData.light().
copyWith(
    appBarTheme:AppBarTheme(
      iconTheme: ThemeData().iconTheme.copyWith(color: Colors.white),
      backgroundColor: Colors.blue.shade700,
      elevation: 12.0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(9.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(18.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue.shade400,
          width: 3,
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
    )
);