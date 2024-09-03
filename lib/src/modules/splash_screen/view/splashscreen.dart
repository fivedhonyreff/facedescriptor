import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpia/src/core/utils/ui_constants/app_size.dart';
import 'package:mpia/src/core/widgets/common_text.dart';
import 'package:mpia/src/modules/splash_screen/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/image_splashscreen.png',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.bigPadding),
              child: CommonText(text: 'Learn Online', fontSize: 24.0),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.bigPadding,
              ),
              child: CommonText(
                text: 'from anywhere',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/images/image_illus_splashscreen.png',
              width: Get.width * 0.8,
            ),
            SizedBox(
              height: Get.height * 0.1,
            )
          ],
        );
      }),
    );
  }
}
