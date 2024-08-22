import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/font_style/font_style_const.dart';
import 'package:clot/src/core/constants/icons/icon_const.dart';
import 'package:clot/src/config/theme/app_theme_mode.dart';
import 'package:clot/src/core/utils/mock_data.dart';
import 'package:clot/src/features/product/page/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomInfoCartWidget extends StatelessWidget {
  const CustomInfoCartWidget({
    super.key,
    required this.modelTitle,
    required this.index,
    this.width = double.infinity,
  });

  final String modelTitle;
  final int index;
  final double width;

  @override
  Widget build(BuildContext context) {
    bool isLight = checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => ProductScreen(model: data[modelTitle]![index])));
      },
      child: Container(
        decoration: BoxDecoration(color: isLight ? ColorConst.grey : ColorConst.darkBg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: width,
                  child: Image.network(
                    data[modelTitle]![index].image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      IconConst.favourite,
                      height: 24,
                      colorFilter: ColorFilter.mode(checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.black : ColorConst.grey, BlendMode.srcIn),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[modelTitle]![index].name,
                    style: FontStyleConst.medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${data[modelTitle]![index].price.toString()}',
                        style: FontStyleConst.small.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      data[modelTitle]![index].discount == 0
                          ? const SizedBox()
                          : Text(
                              '\$${data[modelTitle]![index].discount.toString()}',
                              style: FontStyleConst.small.copyWith(decoration: TextDecoration.lineThrough, color: ColorConst.black.withOpacity(0.5)),
                            ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
