import 'package:clot/src/core/service/hive_service.dart';
import 'package:clot/src/features/splash/domain/usecase/splash_usecase.dart';
import 'package:clot/src/features/splash/presentation/bloc/splash_event.dart';
import 'package:clot/src/features/splash/presentation/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashUsecase splashUsecase;
  SplashBloc({required this.splashUsecase}) : super(SplashInitialState()) {
    on<CheckAuthentication>(
      (event, emit) {
        if (event.id == null) {
          emit(SplashUnAuthenticatedState());
        } else {
          final result = HiveService.instance.readData(key: event.id);
          emit(SplashAuthenticatedState(userInfo: result));
        }
      },
    );
  }
}
