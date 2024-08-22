import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/features/home/page/home_screen.dart';
import 'package:clot/src/features/notification/page/notification_screen.dart';
import 'package:clot/src/features/order/page/order_screen.dart';
import 'package:clot/src/features/settings/page/profile_screen.dart';
import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const NotificationScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];

  void changeNavBarIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Color getNavbarItemColor(int index, bool isLight) {
    if (index == currentIndex) {
      return ColorConst.cPrimary;
    }
    return isLight ? ColorConst.black.withOpacity(0.5) : ColorConst.white.withOpacity(0.5);
  }
}
