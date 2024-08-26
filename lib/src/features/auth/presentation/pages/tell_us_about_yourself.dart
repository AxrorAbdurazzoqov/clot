import 'dart:async';

import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/font_style/font_style_const.dart';
import 'package:clot/src/core/constants/theme/app_theme_mode.dart';
import 'package:clot/src/core/extensions/get_mediaqueyr_height_width.dart';
import 'package:clot/src/core/extensions/show_custom_snack_bar.dart';
import 'package:clot/src/core/service/hive_service.dart';
import 'package:clot/src/core/widgets/elevated_button.dart';
import 'package:clot/src/features/auth/provider/about_yourself.dart';
import 'package:clot/src/features/auth/presentation/widgets/custom_drop_down_button.dart';
import 'package:clot/src/features/auth/presentation/widgets/questionarie_title.dart';
import 'package:clot/src/features/navigation/page/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TellUsAboutYourself extends StatefulWidget {
  const TellUsAboutYourself({super.key});

  @override
  State<TellUsAboutYourself> createState() => _TellUsAboutYourselfState();
}

class _TellUsAboutYourselfState extends State<TellUsAboutYourself> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: context.getHeight * 0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 49),
              child: Text('Tell Us About Yourself', style: FontStyleConst.huge.copyWith(fontWeight: FontWeight.w700)),
            ),
            const QuestionaireText(text: 'What do you shop for?'),
            Padding(
              padding: const EdgeInsets.only(top: 22, bottom: 56),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                        Provider.of<AboutYourselfProvider>(context, listen: false).setGender();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.read<AboutYourselfProvider>().gender ? ColorConst.instance.cPrimary : (checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.grey : ColorConst.instance.darkBg),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 52,
                        child: Center(
                          child: Text("Men", style: TextStyle(fontSize: 16, color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light && !context.read<AboutYourselfProvider>().gender ? ColorConst.instance.black : ColorConst.instance.white, fontFamily: 'Poppins')),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                        Provider.of<AboutYourselfProvider>(context, listen: false).setGender();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.read<AboutYourselfProvider>().gender ? (checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.grey : ColorConst.instance.darkBg) : ColorConst.instance.cPrimary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 52,
                        child: Center(
                          child: Text("Women", style: TextStyle(fontSize: 16, color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light && context.read<AboutYourselfProvider>().gender ? ColorConst.instance.black : ColorConst.instance.white, fontFamily: 'Poppins')),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 13),
              child: QuestionaireText(text: 'How old are you ?'),
            ),
            Container(
              height: 56,
              width: double.infinity,
              decoration: BoxDecoration(
                color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.grey : ColorConst.instance.darkBg,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const CustomDropDownButton(),
            ),
            const Spacer(),
            CustomElevatedButton(
              text: 'Finish',
              onTap: () {
                if (Provider.of<AboutYourselfProvider>(context, listen: false).value == 'Age range') {
                  context.showCustomSnackBar(color: ColorConst.instance.red, title: 'Pick your age');
                } else {
                  HiveService.instance.writeData(key: 'gender', value: Provider.of<AboutYourselfProvider>(context, listen: false).gender);
                  Timer(
                    const Duration(seconds: 2),
                    () {
                      context.showCustomSnackBar(color: ColorConst.instance.orange, title: 'Pick your age');
                    },
                  );
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Navbar()), (_) => false);
                }
              },
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
