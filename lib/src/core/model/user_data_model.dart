import 'package:hive_flutter/hive_flutter.dart';
part 'user_data_model.g.dart';

@HiveType(typeId: 1)
class UserDataModel {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String password;
  @HiveField(4)
  final String avatar;

  UserDataModel({required this.firstName, required this.lastName, required this.email, required this.password, this.avatar = 'https://www.tenforums.com/attachments/user-accounts-family-safety/322690d1615743307-user-account-image-log-user.png'});
}