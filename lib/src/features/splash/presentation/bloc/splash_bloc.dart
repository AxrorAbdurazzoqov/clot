import 'package:clot/src/features/splash/presentation/bloc/splash_event.dart';
import 'package:clot/src/features/splash/presentation/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<CheckAuthentication>(
      (event, emit) {
        if (event.isAuthorizated) {
          emit(SplashUnAuthenticatedState());
        } else {
          emit(SplashAuthenticatedState());
        }
      },
    );
  }
}