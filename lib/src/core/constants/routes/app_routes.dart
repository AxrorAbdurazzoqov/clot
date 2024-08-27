import 'package:clot/src/features/auth/presentation/pages/sign_in_email_screen.dart';
import 'package:clot/src/features/navigation/page/navbar.dart';
import 'package:clot/src/features/splash/presentation/page/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final AppRoutes _instance = AppRoutes.init();
  static AppRoutes get instance => _instance;
  AppRoutes.init();
  Route? onGenerateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;
    switch (settings.name) {
      case '/navbar':
        return pageReturner(Navbar());
      case '/sign_in_email':
        return pageReturner(const SignInEmail());
      default:
        return pageReturner(const SplashScreen());
    }
  }

  pageReturner(Widget page) => MaterialPageRoute(builder: (context) => page);
}