import 'package:get/get.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/vendas_cadastro_controller.dart';

class VendasCadatroBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<VendasCadastroController>(
      VendasCadastroController(),
      permanent: false,
    );
  }
}
