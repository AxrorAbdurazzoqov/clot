import 'package:flutter/material.dart';

class ColorConst {
  static final ColorConst _instance = ColorConst.init();
  static ColorConst get instance => _instance;
  ColorConst.init();

  final  Color cPrimary = const Color(0xff8E6CEF);
  final  Color white = const Color(0xffFFFFFF);
  final  Color black = const Color(0xff000000);
  final  Color grey = const Color(0xffF4F4F4);
  final  Color darkGrey = const Color.fromRGBO(39, 39, 39, 0.5);
  final  Color darkPurple = const Color(0xff1D182A);
  final  Color darkBg = const Color(0xff342F4F);
  final  Color orange = const Color(0xffEC6D26);
  final  Color red = const Color(0xffFA3636);
  final  Color yellow = const Color(0xffF4BD2F);
  final  Color blue = const Color(0xff4468E5);
}
