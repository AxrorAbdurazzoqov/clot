import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/font_style/font_style_const.dart';
import 'package:flutter/material.dart';

ThemeData get light => ThemeData(
      scaffoldBackgroundColor: ColorConst.white,
      appBarTheme: AppBarTheme(backgroundColor: ColorConst.white, elevation: 0),
      bottomAppBarTheme: BottomAppBarTheme(color: ColorConst.white, elevation: 0),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorConst.white,
        elevation: 0,
        selectedItemColor: ColorConst.cPrimary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      textTheme: TextTheme(headlineSmall: FontStyleConst.small, headlineMedium: FontStyleConst.medium, headlineLarge: FontStyleConst.huge, bodyLarge: FontStyleConst.big),
      colorScheme: ColorScheme.light(primary: ColorConst.cPrimary, brightness: Brightness.light),
    );

ThemeData get dark => ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: ColorConst.darkPurple, elevation: 0),
      bottomAppBarTheme: BottomAppBarTheme(color: ColorConst.darkPurple, elevation: 0),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorConst.darkPurple,
        elevation: 0,
        selectedItemColor: ColorConst.cPrimary,
        unselectedItemColor: ColorConst.white.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      scaffoldBackgroundColor: ColorConst.darkPurple,
      textTheme: TextTheme(
        headlineSmall: FontStyleConst.small.copyWith(color: ColorConst.white),
        headlineMedium: FontStyleConst.medium.copyWith(color: ColorConst.white),
        headlineLarge: FontStyleConst.huge.copyWith(color: ColorConst.white),
        bodyLarge: FontStyleConst.big.copyWith(color: ColorConst.white),
      ),
      colorScheme: ColorScheme.dark(primary: ColorConst.cPrimary, brightness: Brightness.dark),
    );
