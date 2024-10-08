import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/vectors/app_vectors.dart';
import 'package:clot/src/core/constants/theme/app_theme_mode.dart';
import 'package:clot/src/features/home/presentation/widget/custom_search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomSearchAppBar({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  State<CustomSearchAppBar> createState() => _CustomSearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomSearchAppBarState extends State<CustomSearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 70,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: CircleAvatar(
          backgroundColor: checkCurrentModeAndGetColor(MediaQuery.of(context).platformBrightness, ColorConst.instance.grey, ColorConst.instance.darkBg),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              AppVectors.instance.chevronBack,
              height: 24,
              colorFilter: ColorFilter.mode(checkCurrentModeAndGetColor(MediaQuery.of(context).platformBrightness, ColorConst.instance.black, ColorConst.instance.white), BlendMode.srcIn),
            ),
          ),
        ),
      ),
      title: CustomSearchField(
        controller: widget._searchController,
        hintText: 'Search',
        autofocus: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(14),
          child: Icon(
            CupertinoIcons.xmark,
            color: checkCurrentModeAndGetColor(MediaQuery.of(context).platformBrightness, ColorConst.instance.black, ColorConst.instance.white),
          ),
        ),
      ),
    );
  }
}
