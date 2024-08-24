import 'package:clot/src/core/model/category_model.dart';
import 'package:clot/src/core/model/products_model.dart';
import 'package:dio/dio.dart';

class ApiServise {
  //! Singleton
  static ApiServise get instance => ApiServise.init();
  ApiServise.init();

  Future<List<CategoryModel>> getCategories() async {
    final Response response = await Dio().get('https://api.escuelajs.co/api/v1/categories');
    return (response.data as List).map((mp) => CategoryModel.fromJson(mp)).toList();
  }

  Future getProducts() async {
    final Response response = await Dio().get('https://api.escuelajs.co/api/v1/products');
    return (response.data as List).map((mp) => ProductsModel.fromJson(mp)).toList();
  }
}
