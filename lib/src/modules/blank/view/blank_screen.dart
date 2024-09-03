import 'package:datetime_setting/datetime_setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpia/src/core/constants/flavors.dart';
import 'package:mpia/src/modules/blank/controller/blank_controller.dart';

class BlankScreen extends GetView<BlankController> {
  const BlankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Blank Page - ${F.title}"),
                TextButton(
                  onPressed: () async {
                    bool timeAuto = await DatetimeSetting.timeIsAuto();
                    bool timezoneAuto = await DatetimeSetting.timeZoneIsAuto();
                    print("is time auto: $timeAuto");
                    print("is time zone auto $timezoneAuto");

                    if (!timezoneAuto || !timeAuto) {
                      DatetimeSetting.openSetting();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                  child: const Text(
                    "Check Time Configuration",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () => controller.goToFaceTraining(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text(
                    "Face Capture",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
