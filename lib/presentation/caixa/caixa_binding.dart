import 'package:get/get.dart';

import 'caixa_controller.dart';

class CaixaBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CaixaController>(
      CaixaController(),
      permanent: false,
    );
  }
}
