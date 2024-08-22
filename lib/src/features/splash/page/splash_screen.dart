import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/icons/icon_const.dart';
import 'package:clot/src/core/service/local_db_service.dart';
import 'package:clot/src/features/login/pages/sign_in_email_screen.dart';
import 'package:clot/src/core/components/navbar/page/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          (context),
          CupertinoPageRoute(
            builder: (contex) => HiveService.instantiate.readData(key: 'email') == null ? const SignInEmail() : const Navbar(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.cPrimary,
      body: Center(
        child: BounceInDown(
          delay: const Duration(milliseconds: 1500),
          child: SvgPicture.asset(IconConst.splash, height: 80),
        ),
      ),
    );
  }
}
