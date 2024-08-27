import 'package:clot/src/core/service/hive_service.dart';
import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {}

class CheckAuthentication extends SplashEvent {
  final dynamic id = HiveService.instance.readData(key: 'id');

  @override
  List<Object?> get props => [
        id
      ];
}
