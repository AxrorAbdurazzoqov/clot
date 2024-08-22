import 'package:clot/src/core/constants/font_style/font_style_const.dart';
import 'package:clot/src/core/constants/icons/icon_const.dart';
import 'package:clot/src/core/widgets/elevated_button.dart';
import 'package:clot/src/features/login/pages/sign_in_password_screen.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(IconConst.email),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text('We Sent you an Email to reset\nyour password.', style: FontStyleConst.big.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            CustomElevatedButton(
              text: 'Return to Login',
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInPassword()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
