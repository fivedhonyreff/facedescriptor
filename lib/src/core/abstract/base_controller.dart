import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mpia/gen/assets.gen.dart';
import 'package:mpia/src/core/mixin/custom_toast_mixin.dart';
import 'package:mpia/src/core/utils/ui_constants/app_colors.dart';

class BaseController extends GetxController with CustomToastMixin {
  RxBool isLoading = false.obs;
  final easyLoading = EasyLoading.instance;
  void showLoading() {
    easyLoading.loadingStyle = EasyLoadingStyle.custom;
    easyLoading.backgroundColor = Colors.black.withOpacity(0.1);
    easyLoading.indicatorWidget = Image.asset(
      Assets.images.gifLoading.path,
      height: 60,
      width: 60,
    );
    easyLoading.textColor = AppTheme.white;
    easyLoading.indicatorColor = Colors.black;
    easyLoading.dismissOnTap = false;
    easyLoading.maskColor = Colors.transparent;
    EasyLoading.show(status: "Loading...");
  }

  void hideLoading() {
    EasyLoading.dismiss();
  }
}
