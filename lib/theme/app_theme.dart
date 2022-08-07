import 'package:flutter/material.dart';

abstract class AppTheme {
  static const Color primaryColor = Colors.indigo;
  static final Color dangerColor = Colors.red.shade400;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: primaryColor)));
}
