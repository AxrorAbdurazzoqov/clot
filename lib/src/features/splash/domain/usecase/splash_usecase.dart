import 'package:clot/src/core/either/either.dart';
import 'package:clot/src/core/usecase/usecase.dart';
import 'package:clot/src/features/splash/data/model/user_model.dart';
import 'package:clot/src/features/splash/domain/repository/splash_repository.dart';

class SplashUsecase extends UseCase<UserModel, int> {
  final SplashRepository _splashRepository;

  SplashUsecase({required SplashRepository repository}) : _splashRepository = repository;
  
  @override
  Future<Either<String, UserModel>> call(int params) async => _splashRepository.getUserInfo(params);
}
