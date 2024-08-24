import 'package:flutter/cupertino.dart';

class CustomListViewWidget extends StatelessWidget {
  const CustomListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(right: 12),
            width: 150,
            // child: CustomInfoCartWidget(modelTitle: , index: index),
          );
        },
      ),
    );
  }
}
