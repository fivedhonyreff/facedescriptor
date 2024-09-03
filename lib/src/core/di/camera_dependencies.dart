import 'package:mpia/src/core/di/injector.dart';
import 'package:mpia/src/core/services/camera_service.dart';
import 'package:mpia/src/core/services/face_detector_service.dart';

Future<void> initializeCameraDependecies() async {
  injector.registerLazySingleton<CameraService>(() => CameraService());

  injector
      .registerLazySingleton<FaceDetectorService>(() => FaceDetectorService());
}
