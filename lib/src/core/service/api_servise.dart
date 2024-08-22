import 'package:clot/src/core/model/category_model.dart';
import 'package:dio/dio.dart';

class ApiServise {
  //! Singleton
  static ApiServise get instance => ApiServise.init();
  ApiServise.init();

  Future<List<CategoryModel>> getCategories() async {
    final Response response = await Dio().get('https://api.escuelajs.co/api/v1/categories');
    return (response.data as List).map((val) => CategoryModel.fromJson(val)).toList();
  }

  Future getProducts() async {
    // final Response response = await Dio().get('https://api.escuelajs.co/api/v1/products');
    // response(response.data as List).map((val) => )
  }
}
