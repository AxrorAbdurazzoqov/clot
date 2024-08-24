import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/vectors/app_vectors.dart';
import 'package:clot/src/core/components/theme/app_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 65,
      leading: Padding(
        padding: const EdgeInsets.only(left: 27),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.grey : ColorConst.instance.darkBg,
          child: SvgPicture.asset(
            AppVectors.instance.chevronBack,
            colorFilter: ColorFilter.mode(checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.black : ColorConst.instance.white, BlendMode.srcIn),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 27),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.grey : ColorConst.instance.darkBg,
            child: SvgPicture.asset(
              AppVectors.instance.favourite,
              colorFilter: ColorFilter.mode(checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.black : ColorConst.instance.white, BlendMode.srcIn),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
