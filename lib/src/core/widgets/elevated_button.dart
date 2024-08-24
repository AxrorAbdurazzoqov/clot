import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height = 50,
    this.width = double.infinity,
  });

  final String text;
  final double width, height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConst.instance.cPrimary,
          borderRadius: BorderRadius.circular(100),
        ),
        height: height,
        width: width,
        child: Center(
          child: Text(text, style: TextStyle(fontSize: 16, color: ColorConst.instance.white, fontFamily: 'Poppins')),
        ),
      ),
    );
  }
}
