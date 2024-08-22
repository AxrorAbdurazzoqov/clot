import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/icons/icon_const.dart';
import 'package:clot/src/config/theme/app_theme_mode.dart';
import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  List<Map<String, dynamic>> data = [
    {
      'icon': IconConst.apple,
      'name': 'Apple'
    },
    {
      'icon': IconConst.google,
      'name': 'Google'
    },
    {
      'icon': IconConst.facebook,
      'name': 'Facebook'
    },
  ];
  

  Color checkAppleIcon(context) => checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.black : ColorConst.white;
}
