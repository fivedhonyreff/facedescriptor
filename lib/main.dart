import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mpia/src/core/routes/app_pages.dart';
import 'src/core/di/injector.dart' as di;

FutureOr<void> main() async {
  await GetStorage.init();
  await di.initializeDependencies();
  runApp(
    GetMaterialApp(
      title: "Cerdas",
      builder: EasyLoading.init(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData.light(
        useMaterial3: false,
      ),
    ),
  );
}
