import 'package:flutter/material.dart';

const primaryColor = Color(0xffFF6464);
const secondaryColor = Color(0xff545974);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
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
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: secondaryColor,
  primaryColor: secondaryColor,
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
      fontWeight: FontWeight.normal,
    ),
  ),
);
