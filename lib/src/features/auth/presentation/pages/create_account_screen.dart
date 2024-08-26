import 'package:clot/src/core/model/user_data_model.dart';
import 'package:clot/src/core/service/hive_service.dart';
import 'package:clot/src/core/utils/app_validators.dart';
import 'package:clot/src/features/auth/presentation/pages/tell_us_about_yourself.dart';
import 'package:clot/src/features/auth/presentation/widgets/base_scaffold.dart';
import 'package:clot/src/features/auth/presentation/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseScaffold(
        hasAppBackButton: true,
        formKey: _formKey,
        title: 'Create Account',
        textFormFields: [
          CustomTextField(
            hintText: 'Firstname',
            controller: _firstnameController,
            textInputAction: TextInputAction.next,
            onValidate: AppValidators.instantiate.name,
          ),
          CustomTextField(
            hintText: 'Lastname',
            controller: _lastnameController,
            textInputAction: TextInputAction.next,
            onValidate: AppValidators.instantiate.name,
          ),
          CustomTextField(hintText: 'Email Address', controller: _emailAddressController, textInputAction: TextInputAction.next, onValidate: AppValidators.instantiate.email),
          CustomTextField(
            hintText: 'Password',
            controller: _passwordController,
            onValidate: AppValidators.instantiate.password,
          ),
        ],
        onTap: () {
          if (_formKey.currentState!.validate()) {
            HiveService.instance.writeData(key: 'user_info', value: UserInfoModel(firstName: _firstnameController.text, lastName: _lastnameController.text, email: _emailAddressController.text, password: _passwordController.text));
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const TellUsAboutYourself()), (_) => false);
          }
        },
      ),
    );
  }
}
