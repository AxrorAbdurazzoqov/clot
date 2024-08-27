import 'package:clot/src/core/either/either.dart';
import 'package:clot/src/features/splash/data/data_source/splash_data_source.dart';
import 'package:clot/src/features/splash/data/model/user_model.dart';
import 'package:clot/src/features/splash/domain/repository/splash_repository.dart';

class SplashRepositoryImpl extends SplashRepository {
  final SplashDataSource _splashDataSource;

  SplashRepositoryImpl({required SplashDataSource splashDataSource}) : _splashDataSource = splashDataSource;
  @override
  Future<Either<String, UserModel>> getUserInfo(int id) async {
    try {
      final result = await _splashDataSource.getUserInfo(id);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}