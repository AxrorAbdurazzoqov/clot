import 'package:animate_do/animate_do.dart';
import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/font_style/font_style_const.dart';
import 'package:clot/src/core/constants/vectors/app_vectors.dart';
import 'package:clot/src/config/theme/app_theme_mode.dart';
import 'package:clot/src/core/utils/app_validators.dart';
import 'package:clot/src/features/login/pages/create_account_screen.dart';
import 'package:clot/src/features/login/pages/sign_in_password_screen.dart';
import 'package:clot/src/features/login/provider/sign_in_provider.dart';
import 'package:clot/src/features/login/widgets/body_padding.dart';
import 'package:clot/src/core/widgets/elevated_button.dart';
import 'package:clot/src/features/login/widgets/suggestion_helper.dart';
import 'package:clot/src/features/login/widgets/text_field.dart';
import 'package:clot/src/features/login/widgets/title_widget.dart';
import 'package:clot/src/core/components/navigation/page/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInEmail extends StatefulWidget {
  const SignInEmail({super.key});

  @override
  State<SignInEmail> createState() => _SignInEmailState();
}

class _SignInEmailState extends State<SignInEmail> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BodyPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitleWidget(title: 'Sign In'),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: Form(
                key: _formKey,
                child: CustomTextField(
                  controller: _emailController,
                  hintText: 'Email Address',
                  onValidate: AppValidators.instantiate.email,
                ),
              ),
            ),
            CustomElevatedButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPassword(
                        email: _emailController.text,
                      ),
                    ),
                  );
                }
              },
              text: 'Continue',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 71),
              child: SuggestionHelper(
                title: 'Dont have an Account?',
                action: 'Create one',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAccountScreen()));
                },
              ),
            ),
            Column(
              children: List.generate(
                3,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const Navbar()), (_) => false);
                      },
                      child: (index % 2 == 0)
                          ? FadeInLeft(
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.grey : ColorConst.darkBg,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 19, right: 30),
                                      child: Image.asset(
                                        context.watch<SignInProvider>().data[index]['icon'],
                                        height: 32,
                                        color: context.watch<SignInProvider>().data[index]['icon'] == AppVectors.instance.apple ? context.read<SignInProvider>().checkAppleIcon(context) : null,
                                      ),
                                    ),
                                    Text(
                                      "Continue With ${context.watch<SignInProvider>().data[index]['name']}",
                                      style: FontStyleConst.medium.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : FadeInRight(
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.grey : ColorConst.darkBg,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 19, right: 30),
                                      child: Image.asset(
                                        context.watch<SignInProvider>().data[index]['icon'],
                                        height: 32,
                                        color: context.watch<SignInProvider>().data[index]['icon'] == AppVectors.instance.apple ? context.read<SignInProvider>().checkAppleIcon(context) : null,
                                      ),
                                    ),
                                    Text(
                                      "Continue With ${context.watch<SignInProvider>().data[index]['name']}",
                                      style: FontStyleConst.medium.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
