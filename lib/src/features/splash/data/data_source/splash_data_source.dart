import 'package:clot/src/core/extensions/check_connection.dart';
import 'package:clot/src/features/splash/data/model/user_model.dart';
import 'package:dio/dio.dart';

abstract class SplashDataSource {
  Future<UserModel> getUserInfo(int id);
}

class SplashDataSourceImpl extends SplashDataSource {
  final Dio _dio;

  SplashDataSourceImpl({required Dio dio}) : _dio = dio;
  @override
  Future<UserModel> getUserInfo(int id) async {
    try {
      final Response response = await _dio.get(
        'https://api.escuelajs.co/api/v1/users/$id',
      );
      if (response.checkStatusCode) {
        return response.data['isAvailable'];
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}
