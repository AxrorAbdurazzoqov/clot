import 'package:clot/src/core/constants/font_style/font_style_const.dart';
import 'package:flutter/material.dart';

class CustomTitleSeeAll extends StatelessWidget {
  const CustomTitleSeeAll({
    super.key,
    required this.title,
    this.titleColor, required this.onPressed,
  });

  final String title;
  final Color? titleColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Text(
            title,
            style: titleColor == null ? FontStyleConst.medium.copyWith(fontWeight: FontWeight.bold) : FontStyleConst.medium.copyWith(color: titleColor, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          TextButton(
            onPressed: onPressed,
            child: Text('See All', style: Theme.of(context).textTheme.headlineMedium),
          ),
        ],
      ),
    );
  }
}
