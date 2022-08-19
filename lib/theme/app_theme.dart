import 'package:flutter/material.dart';

abstract class AppTheme {
  static const Color primaryColor = Colors.indigo;
  static const Color secondaryColor = Colors.pink;
  static final Color dangerColor = Colors.red.shade400;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: primaryColor),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: primaryColor),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(
        color: primaryColor,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: secondaryColor,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      iconColor: primaryColor,
      prefixIconColor: primaryColor,
      suffixIconColor: primaryColor,
    ),
  );
}
