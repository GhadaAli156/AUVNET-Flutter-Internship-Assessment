import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';


class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<UserEntity> login(String email, String password) async {
    final cred = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return UserEntity(uid: cred.user!.uid, email: cred.user!.email!);
  }

  @override
  Future<UserEntity> signUp(String email, String password) async {
    final cred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return UserEntity(uid: cred.user!.uid, email: cred.user!.email!);
  }
 }
