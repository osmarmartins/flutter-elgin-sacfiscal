import 'package:get/get.dart';
import 'package:pdvandroid_flutter/presentation/launcher/launcher_controller.dart';

class LauncherBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LauncherController>(
      LauncherController(),
      permanent: false,
    );
  }
}
