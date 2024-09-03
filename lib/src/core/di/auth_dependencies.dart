import 'package:mpia/src/core/data/datasource/auth/auth_service.dart';
import 'package:mpia/src/core/data/repository/auth/auth_repository_impl.dart';
import 'package:mpia/src/core/di/injector.dart';
import 'package:mpia/src/core/domain/repository/auth/auth_repository.dart';
import 'package:mpia/src/core/domain/usecase/auth/login_usecase.dart';
import 'package:mpia/src/core/services/local_auth_data.dart';

Future<void> initializeAuthDependecies() async {
  injector.registerLazySingleton<LocalAuthData>(() => LocalAuthData());

  injector.registerLazySingleton(
    () => AuthService(injector()),
  );

  injector.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      service: injector(),
      dio: injector(),
      localAuthData: injector(),
    ),
  );

  injector.registerLazySingleton(
    () => LoginUsecase(
      injector(),
    ),
  );
}
