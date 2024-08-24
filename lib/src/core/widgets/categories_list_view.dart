import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/service/api_servise.dart';
import 'package:clot/src/core/components/theme/app_theme_mode.dart';
import 'package:clot/src/features/home/presentation/pages/category_detail_page.dart';
import 'package:flutter/material.dart';

class CatergoryWidget extends StatelessWidget {
  const CatergoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          "Shop by Categories",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 14,
        ),
        FutureBuilder(
          future: ApiServise.instance.getCategories(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoriesDetailPage(
                          modelTitle: snap.data[index].name,
                        ),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      width: double.infinity,
                      height: 64,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.dark ? ColorConst.instance.darkBg : ColorConst.instance.grey),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          CircleAvatar(
                            radius: 40 / 2,
                            backgroundImage: NetworkImage(
                              snap.data[index].image,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            snap.data[index].name,
                            style: Theme.of(context).textTheme.headlineMedium,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snap.hasError) {
              return Center(
                child: Text('Error ${snap.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ],
    );
  }
}
