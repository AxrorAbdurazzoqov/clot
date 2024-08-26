import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable{}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}