import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpia/src/core/widgets/face_painter.dart';
import 'package:mpia/src/modules/facial_recognition/training/controller/face_training_controller.dart';

class FaceTrainingScreen extends GetView<FaceTrainingController> {
  const FaceTrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    showAlertMessage(String msg) => {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(msg),
              );
            },
          )
        };

    Obx body = Obx(() {
      if (controller.initializing.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (controller.previewMode.value) {
        return SafeArea(
          bottom: false,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.file(
                          File(controller.capturedImageFile.value!.path),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 128),
                  Text(
                    controller.shotFaceDetected.value != null
                        ? !controller.isShotFaceOutOfBound
                            ? "Face Detected"
                            : "Face Detected - Out of Bound"
                        : "Face Not Detected",
                    style: const TextStyle(color: Colors.blue),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        );
      }

      return Transform.scale(
        scale: 1.0,
        child: AspectRatio(
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
          child: OverflowBox(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: SizedBox(
                width: width,
                height: width *
                    controller
                        .getCameraService()
                        .cameraController!
                        .value
                        .aspectRatio,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    CameraPreview(
                        controller.getCameraService().cameraController!),
                    CustomPaint(
                      painter: FacePainter(
                          face: controller.faceDetected.value,
                          imageSize: controller.imageSize!),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });

    return Scaffold(
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => TextButton(
            onPressed: () async {
              controller.takeOrResetImage(
                () => showAlertMessage("No Face Detected"),
                () => showAlertMessage("The camera is not ready"),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            child: Text(
              controller.previewMode.value ? "Reset" : "Take Face",
              style: const TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
