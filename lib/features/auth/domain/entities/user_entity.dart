import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String email;

  UserEntity({required this.uid, required this.email});
}
