import 'package:get/get.dart';
import 'package:mpia/src/core/abstract/base_controller.dart';
import 'package:mpia/src/core/di/injector.dart';
import 'package:mpia/src/core/routes/app_pages.dart';
import 'package:mpia/src/core/services/local_auth_data.dart';

class SplashScreenController extends BaseController {
  final _session = injector<LocalAuthData>();
  @override
  void onInit() {
    checkSession();
    super.onInit();
  }

  void checkSession() async {
    final userData = _session.getAuth();
    if (userData != null) {
      // goToDashboard();
    } else {
      // goToLogin();
      goToBlank();
    }
  }

  void goToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed(Routes.login);
  }

  void goToBlank() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.toNamed(Routes.blank);
  }
}
