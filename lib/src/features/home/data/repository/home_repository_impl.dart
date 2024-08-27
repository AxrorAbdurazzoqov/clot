import 'package:clot/src/core/either/either.dart';
import 'package:clot/src/core/model/products_model.dart';
import 'package:clot/src/features/home/data/data_source/home_data_source.dart';
import 'package:clot/src/features/home/data/model/categories_model.dart';
import 'package:clot/src/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepositoryImpl({required HomeDataSource homeDataSource}) : _homeDataSource = homeDataSource;

  @override
  Future<Either<Error, List<CategoriesModel>>> getCategories() async {

    try {
      final result = await _homeDataSource.getCategories();
      return Right(result);
    } catch (e) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, List<ProductsModel>>> getAllProductsByCategory(int id) async {
    try {
      final result = await _homeDataSource.getAllProductsByCategory(id);
      return Right(result);
    } catch (e) {
      return Left(Error());
    }
  }
}
