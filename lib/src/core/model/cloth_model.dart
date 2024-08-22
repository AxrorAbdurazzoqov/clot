import 'package:clot/src/core/utils/mock_data.dart';
import 'package:flutter/cupertino.dart';

class ClothModel {
  final String name;
  final double price;
  final double discount;
  final String image;
  final List<Sizes> sizes;
  final List<Color> colors;
  final Gender gender;

  ClothModel({required this.sizes, required this.colors, required this.gender, required this.name, required this.price, required this.discount, required this.image});
}
