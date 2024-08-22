import 'package:clot/src/core/widgets/categories_list_view.dart';
import 'package:clot/src/features/search/widget/custom_search_app_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomSearchAppBar(searchController: _searchController),
      body: const Padding(
        padding: EdgeInsets.only(top: 10, left: 24, right: 24),
        child: CatergoryWidget(),
      ),
    );
  }
}