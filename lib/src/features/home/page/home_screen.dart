import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/icons/icon_const.dart';
import 'package:clot/src/core/model/category_model.dart';
import 'package:clot/src/core/service/api_servise.dart';
import 'package:clot/src/config/theme/app_theme_mode.dart';
import 'package:clot/src/features/home/page/categories_page.dart';
import 'package:clot/src/features/home/page/category_detail_page.dart';
import 'package:clot/src/features/home/provider/home_provider.dart';
import 'package:clot/src/features/home/widget/custom_search_field.dart';
import 'package:clot/src/features/home/widget/custom_title_see_all.dart';
import 'package:clot/src/core/components/navbar/provider/main_provider.dart';
import 'package:clot/src/features/search/page/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

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
          leading: const Padding(
            padding: EdgeInsets.only(left: 24),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          ),
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
            decoration: BoxDecoration(
              color: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light ? ColorConst.grey : ColorConst.darkBg,
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
                  IconConst.dropButton,
                  colorFilter: ColorFilter.mode(checkCurrentModeAndGetColor(MediaQuery.of(context).platformBrightness, ColorConst.black, ColorConst.white), BlendMode.srcIn),
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
                backgroundColor: ColorConst.cPrimary,
                child: SvgPicture.asset(IconConst.bag),
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
                    child: FutureBuilder(
                      future: ApiServise.instance.getCategories(),
                      builder: (BuildContext context, AsyncSnapshot<List<CategoryModel>> snap) {
                        if (snap.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CategoriesDetailPage(
                                      modelTitle: 'title',
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 13.5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundImage: NetworkImage(snap.data![index].image),
                                      ),
                                      const SizedBox(height: 5),
                                      SizedBox(
                                        width: 65,
                                        child: Center(
                                          child: Text(
                                            snap.data![index].name,
                                            style: Theme.of(context).textTheme.headlineSmall,
                                            maxLines: 2,
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
                        } else if (snap.hasError) {
                          return const Center(
                            child: Text('Something Went Wrong!'),
                          );
                        } else {
                          return const Center(child: CircularProgressIndicator.adaptive());
                        }
                      },
                    ),
                  ),
                  CustomTitleSeeAll(
                    title: 'Top Sellings',
                    onPressed: () {},
                  ),
                  // CustomListViewWidget(
                  //   modelTitle: ,
                  //   isLight: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light,
                  // ),
                  // CustomTitleSeeAll(
                  //   title: 'New In',
                  //   titleColor: ColorConst.cPrimary,
                  //   onPressed: () {},
                  // ),
                  // CustomListViewWidget(
                  //   modelTitle: context.watch<HomeProvider>().categoryModel.last.name.toLowerCase(),
                  //   isLight: checkCurrentMode(MediaQuery.of(context).platformBrightness) == AppThemeMode.light,
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
