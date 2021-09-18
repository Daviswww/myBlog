import 'package:flutter/material.dart';
import 'package:myblog/shared/colors.dart';

class AppThemeData {
  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: oid1Color,
    primaryColor: oid1Color,
    primaryColorDark: oid2Color,
    primaryColorLight: oid3Color,
    toggleableActiveColor: Colors.white,
    hoverColor: oid5Color,
    shadowColor: oid4Color,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 80.0,
        color: oil2Color,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    backgroundColor: oil1Color,
    primaryColor: oil1Color,
    primaryColorDark: oil2Color,
    primaryColorLight: oil3Color,
    toggleableActiveColor: Colors.black,
    hoverColor: oil5Color,
    shadowColor: oil4Color,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 80.0,
        color: oil5Color,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
