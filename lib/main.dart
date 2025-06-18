import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/splash&onboarding/presentation/view/splash_view.dart';
import 'features/auth/domain/entities/user_entity.dart';
import 'features/auth/data/local/user_local_storage.dart';
import 'features/auth/data/repositories/auth_repository_imp.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/signup_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/usecases/restaurants_usecase.dart';
import 'features/home/presentation/bolc/home_bloc.dart';

late final LoginUseCase loginUseCase;
late final SignUpUseCase signUpUseCase;
late final GetRestaurantsUseCase getRestaurantsUseCase;
late final UserLocalStorage userLocalStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  await Hive.openBox<UserEntity>('userBox');

  userLocalStorage = UserLocalStorage();

  final authRepo = AuthRepositoryImpl(FirebaseAuth.instance);
  loginUseCase = LoginUseCase(authRepo);
  signUpUseCase = SignUpUseCase(authRepo);

  final homeRepo = HomeRepositoryImpl();
  getRestaurantsUseCase = GetRestaurantsUseCase(homeRepo);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
        BlocProvider<HomeBloc>(create: (_) => HomeBloc(getRestaurantsUseCase)),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SPlashView(),
      ),
    );
  }
}
