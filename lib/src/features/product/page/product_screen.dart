import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/font_style/font_style_const.dart';
import 'package:clot/src/core/constants/vectors/app_vectors.dart';
import 'package:clot/src/core/model/cloth_model.dart';
import 'package:clot/src/core/components/theme/app_theme_mode.dart';
import 'package:clot/src/features/product/provider/product_provider.dart';
import 'package:clot/src/features/product/widgets/custom_app_bar_widget.dart';
import 'package:clot/src/features/product/widgets/custom_choice_widget.dart';
import 'package:clot/src/features/product/widgets/custom_show_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.model});

  final ClothModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 248,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 248,
                    width: 161,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(model.image),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 15),
              child: Text(context.watch<ProductProvider>().title, style: FontStyleConst.medium),
            ),
            Text(
              '\$${model.price}',
              style: FontStyleConst.medium.copyWith(color: ColorConst.instance.cPrimary, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, top: 33),
              child: Column(
                children: [
                  CustomChoiceWidget(
                    title: 'Size',
                    action: Row(
                      children: [
                        Text('S', style: FontStyleConst.medium),
                        const SizedBox(width: 29),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return CustomShowModalBottomSheet(
                                  title: 'Size',
                                  model: model,
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset(
                            AppVectors.instance.dropButton,
                            colorFilter: ColorFilter.mode(checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.black : ColorConst.instance.white, BlendMode.srcIn),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomChoiceWidget(
                    title: 'Color',
                    action: Row(
                      children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: ColorConst.instance.cPrimary,
                        ),
                        const SizedBox(width: 29),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return CustomShowModalBottomSheet(
                                  title: 'Color',
                                  model: model,
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset(
                            AppVectors.instance.dropButton,
                            colorFilter: ColorFilter.mode(checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.black : ColorConst.instance.white, BlendMode.srcIn),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomChoiceWidget(
                    title: 'Quantity',
                    action: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<ProductProvider>().increment();
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorConst.instance.cPrimary,
                            child: SvgPicture.asset(AppVectors.instance.increment),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text(context.watch<ProductProvider>().quantity.toString()),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<ProductProvider>().decrement();
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorConst.instance.cPrimary,
                            child: SvgPicture.asset(AppVectors.instance.decrement),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          height: 52,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: ColorConst.instance.cPrimary),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${context.watch<ProductProvider>().price * context.watch<ProductProvider>().quantity}', style: FontStyleConst.medium.copyWith(color: ColorConst.instance.white, fontWeight: FontWeight.bold)),
                Text('Add to Bag', style: FontStyleConst.medium.copyWith(color: ColorConst.instance.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
