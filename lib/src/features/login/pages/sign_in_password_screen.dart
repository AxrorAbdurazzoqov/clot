import 'package:clot/src/core/service/local_db_service.dart';
import 'package:clot/src/core/utils/app_validators.dart';
import 'package:clot/src/features/login/pages/forgot_password_screen.dart';
import 'package:clot/src/features/login/widgets/body_padding.dart';
import 'package:clot/src/core/widgets/elevated_button.dart';
import 'package:clot/src/features/login/widgets/suggestion_helper.dart';
import 'package:clot/src/features/login/widgets/text_field.dart';
import 'package:clot/src/features/login/widgets/title_widget.dart';
import 'package:clot/src/core/components/navigation/page/navbar.dart';
import 'package:flutter/material.dart';

class SignInPassword extends StatefulWidget {
  const SignInPassword({super.key, this.email});

  final String? email;

  @override
  State<SignInPassword> createState() => _SignInPasswordState();
}

class _SignInPasswordState extends State<SignInPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BodyPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTitleWidget(title: 'Sign In'),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 16),
                child: Form(
                  key: _formKey,
                  child: CustomTextField(
                    onValidate: AppValidators.instantiate.password,
                    controller: _passwordController,
                    hintText: 'Password',
                  ),
                ),
              ),
              CustomElevatedButton(
                onTap: () {
                  if (_formKey.currentState!.validate() && widget.email!.isNotEmpty) {
                    HiveService.instantiate.writeData(key: 'email', value: widget.email);
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Navbar()), (_) => false);
                  }
                },
                text: 'Continue',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 71),
                child: SuggestionHelper(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                  },
                  title: 'Forgot Password?',
                  action: 'Reset',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
