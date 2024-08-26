import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/theme/app_theme_mode.dart';
import 'package:clot/src/core/constants/vectors/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key, required this.controller, required this.hintText, this.textInputAction = TextInputAction.done, this.isReadOnly, this.onTap, this.autofocus, this.suffixIcon});

  final TextEditingController controller;
  final String hintText;
  final TextInputAction textInputAction;
  final bool? isReadOnly;
  final VoidCallback? onTap;
  final bool? autofocus;
  final Widget? suffixIcon;

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: widget.autofocus ?? false,
      onTap: widget.onTap,
      readOnly: widget.isReadOnly ?? false,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.asset(
            AppVectors.instance.search,
            colorFilter: ColorFilter.mode(checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.black : ColorConst.instance.white.withOpacity(0.5), BlendMode.srcIn),
          ),
        ),
        suffixIcon: widget.suffixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 6),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.black : ColorConst.instance.white.withOpacity(0.5),
            ),
        filled: true,
        fillColor: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.grey : ColorConst.instance.darkBg,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConst.instance.cPrimary),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
