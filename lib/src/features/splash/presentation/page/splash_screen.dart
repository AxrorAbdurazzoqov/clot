import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/vectors/app_vectors.dart';
import 'package:clot/src/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:clot/src/features/splash/presentation/bloc/splash_event.dart';
import 'package:clot/src/features/splash/presentation/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    Timer(const Duration(seconds: 3), () {
      BlocProvider.of<SplashBloc>(context).add(CheckAuthentication());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashAuthenticatedState) {
          Navigator.pushReplacementNamed(context, '/navbar');
        } else if (state is SplashUnAuthenticatedState) {
          Navigator.pushReplacementNamed(context, '/sign_in_email');
        }
      },
      child: Scaffold(
        backgroundColor: ColorConst.instance.cPrimary,
        body: Center(
          child: ZoomIn(
            duration: const Duration(seconds: 2),
            child: SvgPicture.asset(AppVectors.instance.splash, height: 80),
          ),
        ),
      ),
    );
  }
}
