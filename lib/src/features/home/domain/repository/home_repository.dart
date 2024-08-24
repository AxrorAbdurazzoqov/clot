import 'package:clot/src/core/either/either.dart';
import 'package:clot/src/features/home/data/model/categories_model.dart';

abstract class HomeRepository {
  Future<Either<Error, List<CategoriesModel>>> getCategories();
}
