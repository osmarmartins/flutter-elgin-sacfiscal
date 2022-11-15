import 'package:get/get.dart';
import 'package:pdvandroid_flutter/application/application_controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ApplicationController>(
      ApplicationController(),
      permanent: false,
    );
  }
}
