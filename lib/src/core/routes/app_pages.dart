import 'package:get/get.dart';
import 'package:mpia/src/modules/auth/login/binding/login_binding.dart';
import 'package:mpia/src/modules/auth/login/view/login_screen.dart';
import 'package:mpia/src/modules/blank/binding/blank_binding.dart';
import 'package:mpia/src/modules/blank/view/blank_screen.dart';
import 'package:mpia/src/modules/facial_recognition/training/binding/face_training_binding.dart';
import 'package:mpia/src/modules/facial_recognition/training/view/face_training_screen.dart';
import 'package:mpia/src/modules/splash_screen/binding/splash_controller_binding.dart';
import 'package:mpia/src/modules/splash_screen/view/splashscreen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.splash;
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.blank,
      page: () => const BlankScreen(),
      binding: BlankBinding(),
    ),
    GetPage(
      name: Routes.faceTraining,
      page: () => const FaceTrainingScreen(),
      binding: FaceTrainingBinding(),
    )
  ];
}
