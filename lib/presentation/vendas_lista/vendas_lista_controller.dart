import 'package:get/get.dart';
import 'package:pdvandroid_flutter/application/application_pages.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/connection/sqlite_connection.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/venda_entity.dart';

class VendasListaController extends GetxController {
  final _totalGeralVendas = 0.0.obs;
  var listaProdutos = [].obs;

  get totalGeralVendas => _totalGeralVendas.value;
  set totalGeralVendas(value) => _totalGeralVendas.value = value;

  RxList<VendaEntity> listaVendas = RxList<VendaEntity>();

  incluirVenda() async {
    VendaEntity venda = VendaEntity();

    venda.dhemi = DateTime.now().toIso8601String();
    venda.cpfdest = '';
    venda.vprod = 0;

    await Get.find<SQLiteConnection>().vendaDAO.insertData(venda);
    await listarVendas();

    int ultimoID = await obterUltimoRegistroEmAberto();
    VendaEntity? ultimaVenda = await Get.find<SQLiteConnection>()
        .vendaDAO
        .obterRegistroDeVendaPorId(ultimoID);

    Get.toNamed(
      ApplicationRoutes.vendasCadastro,
      arguments: ultimaVenda,
    );
  }

  abrirVenda(int id) async {
    VendaEntity? ultimaVenda = await Get.find<SQLiteConnection>()
        .vendaDAO
        .obterRegistroDeVendaPorId(id);

    Get.toNamed(
      ApplicationRoutes.vendasCadastro,
      arguments: ultimaVenda,
    );
  }

  rmoverVendas() async {
    await Get.find<SQLiteConnection>().database.rawQuery('delete from venda');
  }

  removerRegistroDeVenda(int id) async {
    await Get.find<SQLiteConnection>()
        .database
        .rawQuery('delete from venda where id = $id');
    await listarVendas();
  }

  Future<int> obterUltimoRegistroEmAberto() async {
    List<Map> ultimoID = await Get.find<SQLiteConnection>()
        .database
        .rawQuery('select max(id) as id from venda');
    return ultimoID.first['id'] ?? 0;
  }

  @override
  onInit() async {
    super.onInit();
    await listarVendas();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  listarVendas() async {
    listaVendas.clear();

    totalGeralVendas = 0.0;

    // var data = DateTime.now().toIso8601String();

    List<VendaEntity>? lista =
        await Get.find<SQLiteConnection>().vendaDAO.obterRegistroDeVenda();

    if (lista!.isNotEmpty) {
      listaVendas.addAll(lista);
      for (var venda in lista) {
        totalGeralVendas += venda.vprod;
      }
    }
  }
}
