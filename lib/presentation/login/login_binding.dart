import 'package:get/get.dart';
import 'package:pdvandroid_flutter/presentation/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(),
      permanent: false,
    );
  }
}
