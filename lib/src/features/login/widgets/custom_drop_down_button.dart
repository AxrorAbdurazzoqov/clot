import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/vectors/app_vectors.dart';
import 'package:clot/src/config/theme/app_theme_mode.dart';
import 'package:clot/src/features/login/provider/about_yourself.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        items: const <DropdownMenuItem>[
          DropdownMenuItem(
            value: '0-7',
            child: Text('0-7'),
          ),
          DropdownMenuItem(
            value: '8-17',
            child: Text('8-17'),
          ),
          DropdownMenuItem(
            value: '18-39',
            child: Text('18-39'),
          ),
          DropdownMenuItem(
            value: '40+',
            child: Text('40+'),
          ),
          DropdownMenuItem(
            value: 'Age range',
            child: Text('Age range'),
          ),
        ],
        onChanged: (value) {
          context.read<AboutYourselfProvider>().pickAge(value);
        },
        hint: Text(context.watch<AboutYourselfProvider>().value),
        value: context.watch<AboutYourselfProvider>().value,
        icon: SvgPicture.asset(AppVectors.instance.dropButton, colorFilter: ColorFilter.mode(checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.black : ColorConst.white, BlendMode.srcIn)),
        isExpanded: true,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        dropdownColor: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.grey : ColorConst.darkBg,
      ),
    );
  }
}
