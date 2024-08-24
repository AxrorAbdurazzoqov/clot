import 'package:dio/dio.dart';

extension CheckStatusCode on Response {
  bool get checkStatusCode {
    if (statusCode != null && statusCode! >= 200 && statusCode! <= 300) {
      return true;
    } else {
      return false;
    }
  }
}
