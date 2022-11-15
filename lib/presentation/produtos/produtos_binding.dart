import 'package:get/get.dart';

import 'produtos_controller.dart';

class ProdutosBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProdutosController>(
      ProdutosController(),
      permanent: false,
    );
  }
}
