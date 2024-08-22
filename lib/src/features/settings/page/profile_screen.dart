import 'package:clot/src/core/service/local_db_service.dart';
import 'package:clot/src/features/login/pages/sign_in_email_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          HiveService.instantiate.deleteData(key: 'email');
          Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const SignInEmail()), (_) => false);
        },
        child: const Text('Sign Out'),
      ),
    );
  }
}
