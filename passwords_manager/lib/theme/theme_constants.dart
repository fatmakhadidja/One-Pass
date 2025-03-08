import 'package:flutter/material.dart';

const primaryColor = Color(0xffFF6464);
const secondaryColor = Color(0xff545974);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: primaryColor,
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
    titleSmall: TextStyle(color: secondaryColor, fontSize: 12),
    titleMedium: TextStyle(color: secondaryColor, fontSize: 16),
    titleLarge: TextStyle(color: secondaryColor, fontSize: 20),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: secondaryColor,
  primaryColor: primaryColor,
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
    titleSmall: TextStyle(color: Colors.white, fontSize: 12),
    titleMedium: TextStyle(color: Colors.white, fontSize: 16),
    titleLarge: TextStyle(color: Colors.white, fontSize: 20),
  ),
);
