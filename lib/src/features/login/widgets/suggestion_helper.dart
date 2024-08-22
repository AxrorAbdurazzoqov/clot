import 'package:clot/src/core/constants/font_style/font_style_const.dart';
import 'package:flutter/material.dart';

class SuggestionHelper extends StatelessWidget {
  const SuggestionHelper({
    super.key,
    required this.title,
    required this.action,
    required this.onTap,
  });

  final String title, action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: FontStyleConst.small),
        GestureDetector(
          onTap: onTap,
          child: Text(
            '\t$action',
            style: FontStyleConst.small.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}