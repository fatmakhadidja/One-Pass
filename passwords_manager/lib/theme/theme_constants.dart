import 'package:flutter/material.dart';

const primaryColor = Color(0xffFF6464);
const secondaryColor = Color(0xff545974);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  hintColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Color(0xfff1f1f1),
  indicatorColor: Color(0xffF1F1F1),
  secondaryHeaderColor: secondaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(primaryColor),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      ),
    ),
  ),

  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: secondaryColor,
      fontFamily: 'BabasNeue',
      fontSize: 64,
      fontWeight: FontWeight.normal,
    ),
    headlineMedium: TextStyle(
      color: secondaryColor,
      fontFamily: 'BabasNeue',
      fontSize: 24,
      fontWeight: FontWeight.normal,
    ),
    headlineSmall: TextStyle(
      color: Color(0xffBABABA),
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    titleLarge: TextStyle(
      color: secondaryColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: secondaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'BabasNeue',
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: secondaryColor,
  primaryColor: Color(0xff696E87),
  hintColor: primaryColor,
  indicatorColor: Colors.white,
  secondaryHeaderColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(primaryColor),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      ),
    ),
  ),

  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: Colors.white,
      fontFamily: 'BabasNeue',
      fontSize: 64,
      fontWeight: FontWeight.normal,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontFamily: 'BabasNeue',
      fontSize: 24,
      fontWeight: FontWeight.normal,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: 'BabasNeue',
      fontWeight: FontWeight.w500,
    ),
  ),
);
