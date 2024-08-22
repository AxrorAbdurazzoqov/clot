import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  List orders = [];

  List status = [Status.Processing, Status.Shipped, Status.Delivered, Status.Returned, Status.Cancelled];
}
  enum Status {Processing, Shipped, Delivered, Returned, Cancelled}
