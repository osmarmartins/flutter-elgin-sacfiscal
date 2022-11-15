import 'package:get/get.dart';
import 'package:pdvandroid_flutter/application/application_pages.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sembast/dao/configuracoes_dao.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sembast/entity/configuracoes_entity.dart';

class LauncherController extends GetxController {
  final _keyboardState = false.obs;
  final _ipCaixa = ''.obs;

  get keyboardState => _keyboardState.value;
  set keyboardState(value) => _keyboardState.value = value;

  get ipCaixa => _ipCaixa.value;
  set ipCaixa(value) => _ipCaixa.value = value;

  efetuarLogoff() {
    var configuracoes = Get.find<ConfigruacoesEntity>();
    configuracoes.logado = false;
    Get.find<ConfiguracoesDao>().updateData(configuracoes);
    Get.offAllNamed(ApplicationRoutes.login);
  }

  // @override
  // onInit() async {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
