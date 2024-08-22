import 'package:clot/src/core/constants/font_style/font_style_const.dart';
import 'package:flutter/material.dart';

class QuestionaireText extends StatelessWidget {
  const QuestionaireText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: FontStyleConst.medium,
    );
  }
}