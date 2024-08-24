import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/font_style/font_style_const.dart';
import 'package:flutter/material.dart';

ThemeData get light => ThemeData(
      scaffoldBackgroundColor: ColorConst.instance.white,
      appBarTheme: AppBarTheme(backgroundColor: ColorConst.instance.white, elevation: 0),
      bottomAppBarTheme: BottomAppBarTheme(color: ColorConst.instance.white, elevation: 0),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorConst.instance.white,
        elevation: 0,
        selectedItemColor: ColorConst.instance.cPrimary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      textTheme: TextTheme(headlineSmall: FontStyleConst.small, headlineMedium: FontStyleConst.medium, headlineLarge: FontStyleConst.huge, bodyLarge: FontStyleConst.big),
      colorScheme: ColorScheme.light(primary: ColorConst.instance.cPrimary, brightness: Brightness.light),
    );

ThemeData get dark => ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: ColorConst.instance.darkPurple, elevation: 0),
      bottomAppBarTheme: BottomAppBarTheme(color: ColorConst.instance.darkPurple, elevation: 0),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorConst.instance.darkPurple,
        elevation: 0,
        selectedItemColor: ColorConst.instance.cPrimary,
        unselectedItemColor: ColorConst.instance.white.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      scaffoldBackgroundColor: ColorConst.instance.darkPurple,
      textTheme: TextTheme(
        headlineSmall: FontStyleConst.small.copyWith(color: ColorConst.instance.white),
        headlineMedium: FontStyleConst.medium.copyWith(color: ColorConst.instance.white),
        headlineLarge: FontStyleConst.huge.copyWith(color: ColorConst.instance.white),
        bodyLarge: FontStyleConst.big.copyWith(color: ColorConst.instance.white),
      ),
      colorScheme: ColorScheme.dark(primary: ColorConst.instance.cPrimary, brightness: Brightness.dark),
    );
