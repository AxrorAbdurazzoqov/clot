import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/components/theme/app_theme_mode.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.textInputAction = TextInputAction.done,
    this.onValidate,
  });

  final String hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final String? Function(String?)? onValidate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: onValidate,
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.darkGrey : ColorConst.instance.white.withOpacity(0.5),
            ),
        filled: true,
        fillColor: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.grey : ColorConst.instance.darkBg,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConst.instance.cPrimary),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConst.instance.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConst.instance.red),
        ),
      ),
    );
  }
}
