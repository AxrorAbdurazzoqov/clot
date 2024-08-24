import 'package:clot/src/core/either/either.dart';
import 'package:clot/src/features/home/data/data_source/home_data_source.dart';
import 'package:clot/src/features/home/data/model/categories_model.dart';
import 'package:clot/src/features/home/domain/repository/home_repository.dart';

class CategoriesRepositoryImpl extends HomeRepository {
  final HomeDataSource _categoriesDataSource;

  CategoriesRepositoryImpl({required HomeDataSource categoriesDataSource}) : _categoriesDataSource = categoriesDataSource;

  @override
  Future<Either<Error, List<CategoriesModel>>> getCategories() async {
    try {
      final result = await _categoriesDataSource.getCategories();
      return Right(result);
    } catch (e) {
      return Left(Error());
    }
  }
}
