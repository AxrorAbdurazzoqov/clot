import 'package:clot/src/core/constants/font_style/font_style_const.dart';
import 'package:flutter/material.dart';

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: FontStyleConst.huge);
  }
}