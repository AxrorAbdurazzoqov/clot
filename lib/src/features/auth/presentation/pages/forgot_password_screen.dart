import 'package:clot/src/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:clot/src/features/auth/presentation/widgets/base_scaffold.dart';
import 'package:clot/src/features/auth/presentation/widgets/text_field.dart';
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
    return BaseScaffold(
      hasAppBackButton: true,
      formKey: _formKey,
      title: 'Forgot Password',
      textFormFields: [
        CustomTextField(
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
      ],
      onTap: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ResetPasswordScreen()));
        }
      },
    );
  }
}
