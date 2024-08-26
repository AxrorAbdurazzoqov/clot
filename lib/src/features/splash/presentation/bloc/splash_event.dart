import 'package:clot/src/core/service/hive_service.dart';
import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {}

class CheckAuthentication extends SplashEvent {
  final bool isAuthorizated = HiveService.instance.readData(key: 'user_info')==null;

  @override
  List<Object?> get props => [isAuthorizated];
}
