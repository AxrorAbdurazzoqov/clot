import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/font_style/font_style_const.dart';
import 'package:clot/src/core/model/cloth_model.dart';
import 'package:clot/src/core/components/theme/app_theme_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomShowModalBottomSheet extends StatelessWidget {
  const CustomShowModalBottomSheet({
    super.key,
    required this.title,
    required this.model,
  });

  final String title;
  final ClothModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 390,
      width: double.infinity,
      color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.white : ColorConst.instance.darkPurple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 50),
                Text(title, style: FontStyleConst.huge.copyWith(fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(CupertinoIcons.xmark),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: ListView.builder(
              itemCount: model.sizes.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 56,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.grey : ColorConst.instance.darkBg,
                  ),
                  child: ListTile(
                    selectedColor: ColorConst.instance.white,
                    selected: true,
                    title: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(model.sizes[index].toString().substring(model.sizes[index].toString().indexOf('.') + 1)),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
