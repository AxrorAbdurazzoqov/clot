import 'package:clot/src/core/extensions/check_connection.dart';
import 'package:clot/src/features/home/data/model/categories_model.dart';
import 'package:dio/dio.dart';

abstract class CategoriesDataSource {
  Future<List<CategoriesModel>> getCategories();
}

class CategoriesDataSourceImpl extends CategoriesDataSource {
  final Dio _dio;

  CategoriesDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<CategoriesModel>> getCategories() async {
    try {
      final Response response = await _dio.get('https://api.escuelajs.co/api/v1/categories');

      if (response.checkStatusCode) {
        return (response.data as List).map((json) => CategoriesModel.fromJson(json)).toList();
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
