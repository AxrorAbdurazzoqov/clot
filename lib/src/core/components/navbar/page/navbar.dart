import 'package:clot/src/core/constants/icons/icon_const.dart';
import 'package:clot/src/config/theme/app_theme_mode.dart';
import 'package:clot/src/core/components/navbar/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<MainProvider>().screens[context.watch<MainProvider>().currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.read<MainProvider>().currentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          Provider.of<MainProvider>(context, listen: false).changeNavBarIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconConst.home,
              colorFilter: ColorFilter.mode(context.read<MainProvider>().getNavbarItemColor(0, checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light), BlendMode.srcIn),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconConst.notification,
              colorFilter: ColorFilter.mode(context.read<MainProvider>().getNavbarItemColor(1, checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light), BlendMode.srcIn),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconConst.orders,
              colorFilter: ColorFilter.mode(context.read<MainProvider>().getNavbarItemColor(2, checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light), BlendMode.srcIn),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconConst.profile,
              colorFilter: ColorFilter.mode(context.read<MainProvider>().getNavbarItemColor(3, checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light), BlendMode.srcIn),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
