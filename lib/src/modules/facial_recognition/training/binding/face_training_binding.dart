import 'package:get/get.dart';
import 'package:mpia/src/modules/facial_recognition/training/controller/face_training_controller.dart';

class FaceTrainingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaceTrainingController>(
      () => FaceTrainingController(),
    );
  }
}
