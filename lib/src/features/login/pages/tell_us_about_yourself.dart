import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/config/theme/app_theme_mode.dart';
import 'package:clot/src/core/service/local_db_service.dart';
import 'package:clot/src/core/widgets/elevated_button.dart';
import 'package:clot/src/features/login/provider/about_yourself.dart';
import 'package:clot/src/features/login/widgets/body_padding.dart';
import 'package:clot/src/features/login/widgets/custom_drop_down_button.dart';
import 'package:clot/src/features/login/widgets/questionarie_title.dart';
import 'package:clot/src/features/login/widgets/title_widget.dart';
import 'package:clot/src/core/components/navigation/page/navbar.dart';
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
      body: BodyPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, bottom: 49),
              child: CustomTitleWidget(title: 'Tell Us About Yourself'),
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
                          color: context.read<AboutYourselfProvider>().gender ? ColorConst.cPrimary : (checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.grey : ColorConst.darkBg),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 52,
                        child: Center(
                          child: Text("Men", style: TextStyle(fontSize: 16, color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light && !context.read<AboutYourselfProvider>().gender ? ColorConst.black : ColorConst.white, fontFamily: 'Poppins')),
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
                          color: context.read<AboutYourselfProvider>().gender ? (checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.grey : ColorConst.darkBg) : ColorConst.cPrimary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 52,
                        child: Center(
                          child: Text("Women", style: TextStyle(fontSize: 16, color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light && context.read<AboutYourselfProvider>().gender ? ColorConst.black : ColorConst.white, fontFamily: 'Poppins')),
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
                color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.grey : ColorConst.darkBg,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const CustomDropDownButton(),
            ),
            const Spacer(),
            CustomElevatedButton(
              text: 'Finish',
              onTap: () {
                if (Provider.of<AboutYourselfProvider>(context, listen: false).value == 'Age range') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: ColorConst.red,
                      content: Row(
                        children: [
                          Icon(
                            Icons.info,
                            color: ColorConst.white,
                          ),
                          const SizedBox(width: 8),
                          const Text('Pick your age'),
                        ],
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                } else {
                  HiveService.instantiate.writeData(key: 'gender', value: Provider.of<AboutYourselfProvider>(context, listen: false).gender);
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
