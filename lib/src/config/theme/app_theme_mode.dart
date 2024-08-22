import 'package:flutter/material.dart';

enum AppThemeMode {
  light,
  dark
}

AppThemeMode checkCurrentMode(Brightness mode) {
  if (mode == Brightness.dark) {
    return AppThemeMode.dark;
  } else {
    return AppThemeMode.light;
  }
}

Color checkCurrentModeAndGetColor(Brightness isLight, Color whenLight, Color whenDark){
  if(isLight == Brightness.light) {
    return whenLight;
  }
  return whenDark;
} 