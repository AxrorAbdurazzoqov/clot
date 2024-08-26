import 'package:clot/src/core/service/hive_service.dart';
import 'package:clot/src/core/utils/app_validators.dart';
import 'package:clot/src/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:clot/src/features/auth/presentation/widgets/base_scaffold.dart';
import 'package:clot/src/features/auth/presentation/widgets/suggestion_helper.dart';
import 'package:clot/src/features/auth/presentation/widgets/text_field.dart';
import 'package:clot/src/features/navigation/page/navbar.dart';
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
    return BaseScaffold(formKey: _formKey, title: 'Sign In', textFormFields: [CustomTextField(
                  onValidate: AppValidators.instantiate.password,
                  controller: _passwordController,
                  hintText: 'Password',
                ),], onTap: () {
                if (_formKey.currentState!.validate() && widget.email!.isNotEmpty) {
                  HiveService.instance.writeData(key: 'user_info', value: widget.email);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Navbar()), (_) => false);
                }
              }, bottomChildren: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SuggestionHelper(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                },
                title: 'Forgot Password?',
                action: 'Reset',
              ),
            ),);
  }
}