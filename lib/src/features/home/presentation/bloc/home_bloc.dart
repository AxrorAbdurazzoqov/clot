import 'package:clot/src/core/either/either.dart';
import 'package:clot/src/core/usecase/usecase.dart';
import 'package:clot/src/features/home/domain/usecase/get_all_categories.dart';
import 'package:clot/src/features/home/presentation/bloc/home_event.dart';
import 'package:clot/src/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoriesUseCase categoriesUseCase;
  HomeBloc({required this.categoriesUseCase}) : super(HomeState(status: HomeStatus.loading)) {
    on<GetCategoriesEvent>(
      (event, emit) async {
        final result = await categoriesUseCase.call(NoParams());
        if (result is Right) {
          emit(state.copyWith(status: HomeStatus.success, categoriesModel: result.right));
        } else {
          emit(HomeState(status: HomeStatus.error));
        }
      },
    );
  }
}
