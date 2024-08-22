import 'package:clot/src/core/model/user_data_model.dart';
import 'package:clot/src/core/service/local_db_service.dart';
import 'package:clot/src/core/utils/app_validators.dart';
import 'package:clot/src/core/widgets/elevated_button.dart';
import 'package:clot/src/features/login/pages/tell_us_about_yourself.dart';
import 'package:clot/src/features/login/widgets/custom_app_bar.dart';
import 'package:clot/src/features/login/widgets/text_field.dart';
import 'package:clot/src/features/login/widgets/title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: FocusScope.of(context).hasFocus,
      appBar: const CustomAppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 32),
                child: CustomTitleWidget(title: 'Create Account'),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      hintText: 'Firstname',
                      controller: _firstnameController,
                      textInputAction: TextInputAction.next,
                      onValidate: AppValidators.instantiate.name,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      hintText: 'Lastname',
                      controller: _lastnameController,
                      textInputAction: TextInputAction.next,
                      onValidate: AppValidators.instantiate.name,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(hintText: 'Email Address', controller: _emailAddressController, textInputAction: TextInputAction.next, onValidate: AppValidators.instantiate.email),
                    const SizedBox(height: 16),
                    CustomTextField(
                      hintText: 'Password',
                      controller: _passwordController,
                      onValidate: AppValidators.instantiate.password,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              CustomElevatedButton(
                text: 'Continue',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    HiveService.instantiate.writeData(key: 'email', value: UserDataModel(firstName: _firstnameController.text, lastName: _lastnameController.text, email: _emailAddressController.text, password: _passwordController.text));
                    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const TellUsAboutYourself()), (_) => false);
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
