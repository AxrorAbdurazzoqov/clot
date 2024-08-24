import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/vectors/app_vectors.dart';
import 'package:clot/src/config/theme/app_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBackButton extends StatelessWidget implements PreferredSizeWidget {
  const AppBackButton({super.key, this.title = '', this.hasBack = true});

  final String title;
  final bool hasBack;

  @override
  Widget build(BuildContext context) {
    bool isLight = checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light;
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
      leadingWidth: hasBack ? 60 : null,
      leading: hasBack
          ? Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CircleAvatar(
                backgroundColor: isLight ? ColorConst.grey : ColorConst.darkBg,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset(
                    AppVectors.instance.chevronBack,
                    height: 24,
                    colorFilter: ColorFilter.mode(isLight ? ColorConst.black : ColorConst.white, BlendMode.srcIn),
                  ),
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
