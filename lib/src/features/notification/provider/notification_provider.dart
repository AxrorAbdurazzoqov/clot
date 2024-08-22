import 'package:clot/src/core/model/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  List<NotificationModel> notifications = [
    NotificationModel(notificationText: 'Gilbert, you placed and order check your order history for full details'),
    NotificationModel(notificationText: 'Gilbert, Thank you for shopping with us we have canceled order #24568.', orderNumber: 24568, isRead: true),
    NotificationModel(notificationText: 'Gilbert, your Order #24568 has been confirmed check your order history for full details', orderNumber: 24568, isRead: true),
  ];

  void deleteNotification(index) {
    notifications.removeAt(index);
    notifyListeners();
  }

  void readNotification(index) {
    notifications[index].isRead = true;
    notifyListeners();
  }
}
