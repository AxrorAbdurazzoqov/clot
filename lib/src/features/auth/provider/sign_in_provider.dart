import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/vectors/app_vectors.dart';
import 'package:clot/src/core/constants/theme/app_theme_mode.dart';
import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  List<Map<String, dynamic>> data = [
    {
      'icon': AppVectors.instance.apple,
      'name': 'Apple'
    },
    {
      'icon': AppVectors.instance.google,
      'name': 'Google'
    },
    {
      'icon': AppVectors.instance.facebook,
      'name': 'Facebook'
    },
  ];

  Color checkAppleIcon(context) => checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.black : ColorConst.instance.white;
}
