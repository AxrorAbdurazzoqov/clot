import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/theme/app_theme_mode.dart';
import 'package:clot/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:clot/src/features/home/presentation/bloc/home_state.dart';
import 'package:clot/src/features/home/presentation/pages/category_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == HomeStatus.success) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoriesDetailPage(
                          modelTitle: state.categoriesModel![index].name,
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
                              state.categoriesModel![index].image,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            state.categoriesModel![index].name,
                            style: Theme.of(context).textTheme.headlineMedium,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state.status == HomeStatus.error) {
              return Center(
                child: Text('Error ${state.errorMessage}'),
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
