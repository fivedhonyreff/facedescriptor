import 'package:get_it/get_it.dart';
import 'package:mpia/src/core/di/auth_dependencies.dart';
import 'package:mpia/src/core/di/camera_dependencies.dart';

import '../services/dio_services.dart';

final injector = GetIt.I;

Future<void> initializeDependencies() async {
  injector.registerLazySingleton(
    () => dioServices(),
  );

  // auth
  await initializeAuthDependecies();
  await initializeCameraDependecies();
}
