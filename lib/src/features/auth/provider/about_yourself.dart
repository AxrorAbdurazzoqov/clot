import 'package:flutter/material.dart';

class AboutYourselfProvider extends ChangeNotifier {
  String value = 'Age range';
  bool gender = true;

  void setGender() {
    gender = !gender;
    notifyListeners();
  }

  void pickAge(val) {
    value = val;
    notifyListeners();
  }
}
