import 'package:clot/src/core/either/either.dart';
import 'package:clot/src/core/usecase/usecase.dart';
import 'package:clot/src/features/home/data/model/categories_model.dart';
import 'package:clot/src/features/home/domain/repository/home_repository.dart';

class CategoriesUseCase extends UseCase<List<CategoriesModel>, NoParams> {
  final HomeRepository _repository;

  CategoriesUseCase({required HomeRepository repository}) : _repository = repository;
  @override
  Future<Either<Error, List<CategoriesModel>>> call(NoParams params) async {
    return _repository.getCategories();
  }
}
