import 'package:clot/src/core/widgets/elevated_button.dart';
import 'package:clot/src/features/home/page/categories_page.dart';
import 'package:flutter/material.dart';

class NoSomethingWidget extends StatelessWidget {
  const NoSomethingWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          CustomElevatedButton(
            text: 'Explore Categories',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoriesPage(),
              ),
            ),
            width: 200,
          ),
        ],
      ),
    );
  }
}