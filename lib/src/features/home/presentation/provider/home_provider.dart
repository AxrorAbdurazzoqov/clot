import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  bool gender = true;
  List categories = [];
  List products = [];


  void changeGender() {
    gender = !gender;
    notifyListeners();
  }
}