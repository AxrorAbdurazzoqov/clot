import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/icons/icon_const.dart';
import 'package:clot/src/core/widgets/app_back_button.dart';
import 'package:clot/src/core/widgets/no_something_widget.dart';
import 'package:clot/src/features/order/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBackButton(
        hasBack: false,
        title: 'Orders',
      ),
      body: context.watch<OrderProvider>().orders.isEmpty
          ? const NoSomethingWidget(icon: IconConst.noOrders, title: 'No Orders yet')
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, right: 27, bottom: 24),
                  height: 34,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: context.watch<OrderProvider>().status.length,
                    itemBuilder: (BuildContext context, int index) {
                      final text = context.watch<OrderProvider>().status[index].toString();
                      return GestureDetector(
                        onTap: () {},
                        child: IntrinsicWidth(
                          child: Container(
                            height: 34,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            margin: const EdgeInsets.only(right: 13),
                            decoration: BoxDecoration(
                              color: ColorConst.cPrimary,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(text.substring(text.indexOf('.') + 1)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
