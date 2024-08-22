import 'package:clot/src/core/service/api_servise.dart';
import 'package:clot/src/core/widgets/app_back_button.dart';
import 'package:clot/src/core/widgets/custom_info_cart_widget.dart';
import 'package:flutter/material.dart';

class CategoriesDetailPage extends StatelessWidget {
  const CategoriesDetailPage({super.key, required this.modelTitle});

  final String modelTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      body: FutureBuilder(
        future: ApiServise.instance.getCategories(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Text(
                        '$modelTitle\t',
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      snap.data.length == 0 ? const SizedBox() : Text('(${snap.data.length})', style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: snap.data.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.6, crossAxisSpacing: 10, mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return CustomInfoCartWidget(index: index, modelTitle: '',);
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (snap.hasError) {
            return Center(
              child: Text(snap.error.toString()),
            );
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
    );
  }
}
