import 'package:flutter/material.dart';

class BodyPadding extends StatelessWidget {
  const BodyPadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23, right: 23, top: 123),
      child: child,
    );
  }
}
