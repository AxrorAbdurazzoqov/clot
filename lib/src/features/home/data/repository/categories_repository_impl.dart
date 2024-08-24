import 'package:clot/src/core/either/either.dart';
import 'package:clot/src/features/home/data/data_source/category_data_source.dart';
import 'package:clot/src/features/home/data/model/categories_model.dart';
import 'package:clot/src/features/home/domain/repository/categories_repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final CategoriesDataSource _categoriesDataSource;

  CategoriesRepositoryImpl({required CategoriesDataSource categoriesDataSource}) : _categoriesDataSource = categoriesDataSource;

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
