import 'package:get/get.dart';
import 'package:mpia/src/core/abstract/base_controller.dart';
import 'package:mpia/src/core/routes/app_pages.dart';

class BlankController extends BaseController {
  void goToFaceTraining() {
    Get.toNamed(Routes.faceTraining);
  }
}
