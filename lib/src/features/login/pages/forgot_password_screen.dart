import 'package:clot/src/core/widgets/elevated_button.dart';
import 'package:clot/src/features/login/pages/reset_password_screen.dart';
import 'package:clot/src/features/login/widgets/custom_app_bar.dart';
import 'package:clot/src/features/login/widgets/text_field.dart';
import 'package:clot/src/features/login/widgets/title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  void dispose() {
    _forgotPasswordController.dispose();
    super.dispose();
  }

  final TextEditingController _forgotPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomTitleWidget(title: 'Forgot Password'),
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 24),
                child: Form(
                  key: _formKey,
                  child: CustomTextField(
                    hintText: 'Enter Email address',
                    controller: _forgotPasswordController,
                    onValidate: (email) {
                      if (email!.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
                        return 'Invalid email format';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              CustomElevatedButton(
                text: 'Continue',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ResetPasswordScreen()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
