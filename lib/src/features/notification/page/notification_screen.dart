import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/vectors/app_vectors.dart';
import 'package:clot/src/core/model/notification_model.dart';
import 'package:clot/src/core/widgets/app_back_button.dart';
import 'package:clot/src/core/widgets/no_something_widget.dart';
import 'package:clot/src/features/notification/provider/notification_provider.dart';
import 'package:clot/src/features/notification/widgets/notification_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> data = context.watch<NotificationProvider>().notifications;
    return data.isNotEmpty
        ? Scaffold(
            appBar: const AppBackButton(
              title: 'Notification',
              hasBack: false,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CupertinoContextMenu.builder(
                      actions: [
                        CupertinoContextMenuAction(
                          onPressed: () {
                            Provider.of<NotificationProvider>(context, listen: false).readNotification(index);
                            Navigator.pop(context);
                          },
                          trailingIcon: CupertinoIcons.bell,
                          child: const Text('read notification'),
                        ),
                        CupertinoContextMenuAction(
                          onPressed: () {
                            Provider.of<NotificationProvider>(context, listen: false).deleteNotification(index);
                            Navigator.pop(context);
                          },
                          trailingIcon: CupertinoIcons.delete,
                          child: Text(
                            'Delete notification',
                            style: TextStyle(color: ColorConst.instance.red),
                          ),
                        ),
                      ],
                      builder: (context, animation) {
                        return Material(
                          color: Colors.transparent,
                          child: NotificationCardWidget(
                            data: data,
                            index: index,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          )
        : NoSomethingWidget(
            title: 'No Notification yet',
            icon: AppVectors.instance.noNotification,
          );
  }
}
