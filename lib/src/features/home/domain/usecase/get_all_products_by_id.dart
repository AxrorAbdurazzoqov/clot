import 'package:clot/src/core/either/either.dart';
import 'package:clot/src/core/model/products_model.dart';
import 'package:clot/src/core/usecase/usecase.dart';
import 'package:clot/src/features/home/domain/repository/home_repository.dart';

class GetAllProductsByIdUseCase extends UseCase<List<ProductsModel>, int> {
  final HomeRepository _repository;

  GetAllProductsByIdUseCase({required HomeRepository homeRepository}) : _repository = homeRepository;
  @override
  Future<Either<dynamic, List<ProductsModel>>> call(int params) =>  _repository.getAllProductsByCategory(params);
}
