import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/state_manager.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image/image.dart' as img;
import 'package:mpia/src/core/abstract/base_controller.dart';
import 'package:mpia/src/core/di/injector.dart';
import 'package:mpia/src/core/services/camera_service.dart';
import 'package:mpia/src/core/services/face_detector_service.dart';

class FaceTrainingController extends BaseController {
  final _cameraService = injector<CameraService>();
  final _faceDetectorService = injector<FaceDetectorService>();

  var initializing = true.obs;
  var previewMode = false.obs;
  var faceDetected = Rxn<Face>();
  var shotFaceDetected = Rxn<Face>();
  Size? imageSize;
  bool _detectingFaces = false;
  bool isShotFaceOutOfBound = false;
  var capturedImageFile = Rxn<XFile>();
  bool _isCameraReady = false;

  @override
  void onInit() {
    _initializeCamera();
    super.onInit();
  }

  void _initializeCamera() async {
    initializing.value = true;
    await _cameraService.initialize();
    _faceDetectorService.initialize();
    initializing.value = false;

    _capture();
  }

  void _setCameraReady() async {
    if (!_isCameraReady) {
      await Future.delayed(const Duration(milliseconds: 1000));
      _isCameraReady = true;
    }
  }

  void _capture() {
    imageSize = _cameraService.getImageSize();

    _cameraService.cameraController?.startImageStream((image) async {
      _setCameraReady();

      if (_detectingFaces) return;

      _detectingFaces = true;

      try {
        await _faceDetectorService.detectFacesFromImage(image);

        if (_faceDetectorService.faces.isNotEmpty) {
          faceDetected.value = _faceDetectorService.faces[0];
        } else {
          faceDetected.value = null;
        }

        _detectingFaces = false;
      } catch (e) {
        _detectingFaces = false;
      }
    });
  }

  void takeOrResetImage(
    Function onNoFaceDetected,
    Function onCameraNotReady,
  ) async {
    if (previewMode.value) {
      _initializeCamera();
      previewMode.value = false;
    } else if (!_isCameraReady) {
      onCameraNotReady();
    } else if (faceDetected.value != null) {
      _isCameraReady = false;
      await _cameraShot();
      previewMode.value = true;
      disposeCamera();
    } else {
      onNoFaceDetected();
    }
  }

  Future<void> _cameraShot() async {
    var captured = (await _cameraService.takePicture())!;
    capturedImageFile.value = captured;
    await _faceDetectorService.detectFacesFromImageFile(captured);
    if (_faceDetectorService.faces.isNotEmpty) {
      shotFaceDetected.value = _faceDetectorService.faces[0];
      isShotFaceOutOfBound = false;
      capturedImageFile.value = await cropFace(onOutOfBound: () {
        isShotFaceOutOfBound = true;
      });
    } else {
      shotFaceDetected.value = null;
    }
  }

  Future<XFile?> cropFace({Function? onOutOfBound}) async {
    var imageFile = capturedImageFile.value;
    var shotFace = shotFaceDetected.value;
    if (imageFile == null || shotFace == null) return imageFile;

    img.Image image =
        img.decodeImage(await File(imageFile.path).readAsBytes())!;

    // add gap for next face detection process :v wkwkwk
    var boundingBox = Rect.fromLTRB(
        shotFace.boundingBox.left - 24,
        shotFace.boundingBox.top - 24,
        shotFace.boundingBox.right + 24,
        shotFace.boundingBox.bottom + 24);

    if (!validateBounding(image, boundingBox)) {
      onOutOfBound?.call();
      return imageFile;
    }

    img.Image cropped = img.copyCrop(image,
        x: boundingBox.left.toInt(),
        y: boundingBox.top.toInt(),
        width: boundingBox.width.toInt(),
        height: boundingBox.height.toInt());

    var croppedFile = File(imageFile.path);
    await croppedFile.writeAsBytes(img.encodePng(cropped));

    return XFile(croppedFile.path);
  }

  bool validateBounding(img.Image image, Rect rect) {
    if (rect.left < 0) return false;
    if (rect.top < 0) return false;
    if (rect.right > image.width) return false;
    if (rect.bottom > image.height) return false;
    return true;
  }

  CameraService getCameraService() {
    return _cameraService;
  }

  void disposeCamera() {
    _cameraService.dispose();
    _faceDetectorService.dispose();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  @override
  void dispose() {
    disposeCamera();
    super.dispose();
  }
}
