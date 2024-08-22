class NotificationModel {
  final String notificationText;
  bool isRead;
  final int? orderNumber;

  NotificationModel({required this.notificationText, this.isRead = false, this.orderNumber});
}
