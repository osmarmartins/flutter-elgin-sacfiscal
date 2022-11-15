import 'package:get/get.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/connection/sqlite_connection.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/forma_pagto_entity.dart';

class FormaPagamentoController extends GetxController {
  final RxList<FormaPagtoEntity> _listaFormaPagamentos = RxList<FormaPagtoEntity>();
  final _isLoading = false.obs;

  List<FormaPagtoEntity> get listaFormaPagamentos => _listaFormaPagamentos;
  set listaFormaPagamentos(value) => _listaFormaPagamentos.value = value;

  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  buscarFormaPagamento({
    String campoBusca = '',
  }) async {
    isLoading = true;

    List<FormaPagtoEntity> formasPagamento;

    if (campoBusca.trim() == '') {
      formasPagamento = await Get.find<SQLiteConnection>().formaPagtoDAO.findAll();
    } else {
      formasPagamento = await Get.find<SQLiteConnection>().formaPagtoDAO.findByName(campoBusca.trim());
    }

    _listaFormaPagamentos.clear();
    _listaFormaPagamentos.addAll(formasPagamento);

    isLoading = false;
  }

  @override
  onInit() async {
    await buscarFormaPagamento();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
