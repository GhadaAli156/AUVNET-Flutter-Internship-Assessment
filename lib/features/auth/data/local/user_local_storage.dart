import 'package:hive/hive.dart';
import '../../domain/entities/user_entity.dart';

class UserLocalStorage {
  final _box = Hive.box<UserEntity>('userBox');

  Future<void> saveUser(UserEntity user) async {
    await _box.put('currentUser', user);
  }

  UserEntity? getUser() {
    return _box.get('currentUser');
  }

  Future<void> deleteUser() async {
    await _box.delete('currentUser');
  }

  bool isLoggedIn() {
    return _box.containsKey('currentUser');
  }
}
