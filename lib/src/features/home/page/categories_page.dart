import 'package:clot/src/core/widgets/app_back_button.dart';
import 'package:clot/src/core/widgets/categories_list_view.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: CatergoryWidget(),
      ),
    );
  }
}
