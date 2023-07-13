import 'package:get_it/get_it.dart';

import '../data/remote/authentication/auth_interface.dart';
import '../data/remote/authentication/auth_repository.dart';
import '../data/remote/authentication/auth_services.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator() async {
 


  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(

    ),
  );
  locator.registerLazySingleton<AuthService>(
    () => AuthServiceImpl(),
  );
}