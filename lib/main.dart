import 'package:clot/src/core/constants/theme/app_theme.dart';
import 'package:clot/src/core/service/local_db_service.dart';
import 'package:clot/src/features/home/presentation/provider/home_provider.dart';
import 'package:clot/src/features/login/provider/about_yourself.dart';
import 'package:clot/src/features/login/provider/sign_in_provider.dart';
import 'package:clot/src/core/components/navigation/provider/main_provider.dart';
import 'package:clot/src/features/notification/provider/notification_provider.dart';
import 'package:clot/src/features/order/provider/order_provider.dart';
import 'package:clot/src/features/product/provider/product_provider.dart';
import 'package:clot/src/features/splash/page/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  HiveService.instantiate.createBox();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SignInProvider()),
      ChangeNotifierProvider(create: (context) => AboutYourselfProvider()),
      ChangeNotifierProvider(create: (context) => ProductProvider(title: '', price: 0)),
      ChangeNotifierProvider(create: (context) => MainProvider()),
      ChangeNotifierProvider(create: (context) => HomeProvider()),
      ChangeNotifierProvider(create: (context) => NotificationProvider()),
      ChangeNotifierProvider(create: (context) => OrderProvider()),
    ],
    child: const Clot(),
  ));
}

class Clot extends StatelessWidget {
  const Clot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clot',
      theme: light,
      darkTheme: dark,
      home: const SplashScreen(),
    );
  }
}
