import 'package:get/get.dart';
import 'package:pdvandroid_flutter/presentation/vendas_lista/vendas_lista_controller.dart';

class VendasListaBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<VendasListaController>(
      VendasListaController(),
      permanent: false,
    );
  }
}
