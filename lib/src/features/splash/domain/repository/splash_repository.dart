import 'package:clot/src/core/either/either.dart';
import 'package:clot/src/features/splash/data/model/user_model.dart';

abstract class SplashRepository{
  Future<Either<String, UserModel>> getUserInfo(int id);
}