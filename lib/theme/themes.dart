import 'package:flutter/material.dart';

class MyThemes {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.black,
          secondary: Color(0XFFF2F4F7),
          onSecondary: Color(0XFFF2F4F7),
          error: Colors.redAccent,
          onError: Colors.redAccent,
          background: Colors.white,
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          fontFamily: "Axiforma",
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'Axiforma', fontSize: 14, color: Color(0XFF1C1917)),
          subtitle1: TextStyle(
              fontFamily: 'Axiforma', fontSize: 14, color: Color(0XFF667085))));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0XFF000F24),
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.white,
          onPrimary: Colors.white,
          secondary: Color(0XFFA9B8D4),
          onSecondary: Color(0XFFA9B8D4),
          error: Colors.redAccent,
          onError: Colors.redAccent,
          background: Color(0XFF000F24),
          onBackground: Color(0XFF000F24),
          surface: Color(0XFF000F24),
          onSurface: Color(0XFF000F24)),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Color(0XFF000F24),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          fontFamily: "Axiforma",
        ),
      ),
      scaffoldBackgroundColor: const Color(0XFF000F24),
      textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Axiforma',
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          subtitle1: TextStyle(
            fontFamily: 'Axiforma',
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          )));
}
