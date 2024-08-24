import 'package:clot/src/core/either/either.dart';

abstract class UseCase<Type, Params> {
  Future<Either<dynamic, Type>> call(Params params);
}

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class Equatable {
}
