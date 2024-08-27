import 'package:clot/src/features/splash/data/model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {}

class SplashInitialState extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashAuthenticatedState extends SplashState {
  final UserModel userInfo;

  SplashAuthenticatedState({required this.userInfo});

  @override
  List<Object?> get props => [];
}

class SplashUnAuthenticatedState extends SplashState {
  @override
  List<Object?> get props => [];
}
