import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/vectors/app_vectors.dart';
import 'package:clot/src/core/constants/theme/app_theme_mode.dart';
import 'package:clot/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:clot/src/features/home/presentation/bloc/home_event.dart';
import 'package:clot/src/features/home/presentation/bloc/home_state.dart';
import 'package:clot/src/features/home/presentation/pages/categories_page.dart';
import 'package:clot/src/features/home/presentation/pages/category_detail_page.dart';
import 'package:clot/src/features/home/presentation/provider/home_provider.dart';
import 'package:clot/src/features/home/presentation/widget/custom_search_field.dart';
import 'package:clot/src/features/home/presentation/widget/custom_title_see_all.dart';
import 'package:clot/src/features/navigation/provider/main_provider.dart';
import 'package:clot/src/features/search/page/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(GetCategoriesEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          leadingWidth: 70,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: CircleAvatar(
              backgroundImage: AssetImage(AppVectors.instance.defaultAvatar),
            ),
          ),
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
            decoration: BoxDecoration(
              color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.instance.grey : ColorConst.instance.darkBg,
              borderRadius: BorderRadius.circular(100),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                items: const <DropdownMenuItem>[
                  DropdownMenuItem(
                    value: 'Men',
                    child: Text('Men'),
                  ),
                  DropdownMenuItem(
                    value: 'Women',
                    child: Text('Women '),
                  ),
                ],
                onChanged: (gender) {
                  context.read<HomeProvider>().changeGender();
                },
                hint: Text(context.watch<HomeProvider>().gender ? 'Men' : 'Women '),
                icon: SvgPicture.asset(
                  AppVectors.instance.dropButton,
                  colorFilter: ColorFilter.mode(checkCurrentModeAndGetColor(MediaQuery.of(context).platformBrightness, ColorConst.instance.black, ColorConst.instance.white), BlendMode.srcIn),
                  height: 16,
                ),
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                context.read<MainProvider>().changeNavBarIndex(2);
              },
              child: CircleAvatar(
                radius: 25,
                backgroundColor: ColorConst.instance.cPrimary,
                child: SvgPicture.asset(AppVectors.instance.bag),
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  CustomSearchField(
                    controller: _searchController,
                    hintText: 'Search',
                    isReadOnly: true,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
                    },
                  ),
                  CustomTitleSeeAll(
                    title: 'Categories',
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (constext) => const CategoriesPage())),
                  ),
                  SizedBox(
                    height: 100,
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.status == HomeStatus.success) {
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
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
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundImage: NetworkImage(state.categoriesModel![index].image),
                                      ),
                                      const SizedBox(height: 5),
                                      SizedBox(
                                        width: 65,
                                        child: Center(
                                          child: Text(
                                            state.categoriesModel![index].name,
                                            style: Theme.of(context).textTheme.headlineSmall,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (state.status == HomeStatus.error) {
                          return Center(child: Text(state.errorMessage));
                        } else {
                          return const Center(child: CircularProgressIndicator.adaptive());
                        }
                      },
                    ),
                  ),
                  // CustomTitleSeeAll(
                  //   title: 'Top Sellings',
                  //   onPressed: () {},
                  // ),
                  // CustomListViewWidget(

                  // ),
                  // CustomTitleSeeAll(
                  //   title: 'New In',
                  //   titleColor: ColorConst.instance.cPrimary,
                  //   onPressed: () {},
                  // ),
                  // CustomListViewWidget(
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
