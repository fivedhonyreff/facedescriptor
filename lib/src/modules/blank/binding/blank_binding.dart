import 'package:get/get.dart';
import 'package:mpia/src/modules/blank/controller/blank_controller.dart';

class BlankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlankController>(
      () => BlankController(),
    );
  }
}
