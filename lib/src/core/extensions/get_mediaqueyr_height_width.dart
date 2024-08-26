import 'package:flutter/widgets.dart';

extension GetMediaqueyrHeightWidth on BuildContext {
  double get getHeight => MediaQuery.of(this).size.height;
  double get getWidth => MediaQuery.of(this).size.width;
}
