import 'package:get/get.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sembast/entity/configuracoes_entity.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/connection/sqlite_connection.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/caixa_entity.dart';

// List<Map> list =
//     await Get.find<SQLiteConnection>().database.rawQuery('select max(id) from caixa where terminal = "01"');
// await Get.find<SQLiteConnection>().database.rawQuery('delete from caixa');

class CaixaController extends GetxController {
  final _isLoading = false.obs;

  final _registroDeCaixa = CaixaEntity().obs;
  final _valorAbertura = 0.0.obs;
  final _valorFechamento = 0.0.obs;
  final _caixaAberto = false.obs;

  RxList<CaixaEntity> listaCaixa = RxList<CaixaEntity>();

  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  CaixaEntity get registroDeCaixa => _registroDeCaixa.value;
  set registroDeCaixa(value) => _registroDeCaixa.value = value;

  get valorAbertura => _valorAbertura.value;
  set valorAbertura(value) => _valorAbertura.value = value;

  get valorFechamento => _valorFechamento.value;
  set valorFechamento(value) => _valorFechamento.value = value;

  get caixaAberto => _caixaAberto.value;
  set caixaAberto(value) => _caixaAberto.value = value;

  Future<int> obterUltimoRegistroEmAberto() async {
    List<Map> ultimoID =
        await Get.find<SQLiteConnection>().database.rawQuery('select max(id) as id from caixa where terminal = "01"');
    return ultimoID.first['id'] ?? 0;
  }

  limparCaixa() async {
    await Get.find<SQLiteConnection>().database.rawQuery('delete from caixa');
  }

  removerRegistroDeCaixa(int id) async {
    await Get.find<SQLiteConnection>().database.rawQuery('delete from caixa where id = $id');
    await listarRegistrosDeCaixa();
  }

  listarRegistrosDeCaixa() async {
    listaCaixa.clear();

    var data = DateTime.now().toIso8601String();

    List<CaixaEntity>? lista = await Get.find<SQLiteConnection>().caixaDAO.obterRegistroDeCaixaDia(data);

    if (lista!.isNotEmpty) {
      listaCaixa.addAll(lista);
      listaCaixa.sort((a, b) => (b.id!.compareTo(a.id as num)));
    }
  }

  obterRegistroDeCaixa({
    bool abrirCaixa = false,
  }) async {
    int ultimoID = await obterUltimoRegistroEmAberto();
    var data = DateTime.now().toIso8601String();
    var registro = await Get.find<SQLiteConnection>().caixaDAO.obterRegistroDeCaixa(ultimoID, data);

    if (registro == null && abrirCaixa == true) {
      registroDeCaixa = CaixaEntity();

      registroDeCaixa.idUsuario = Get.find<ConfigruacoesEntity>().id;
      registroDeCaixa.terminal = Get.find<ConfigruacoesEntity>().caixa!;
      registroDeCaixa.abertura = DateTime.now().toIso8601String();
      registroDeCaixa.valorAbertura = 0;

      postData(registroDeCaixa);

      int ultimoID = await obterUltimoRegistroEmAberto();
      registroDeCaixa = await Get.find<SQLiteConnection>().caixaDAO.obterRegistroDeCaixa(ultimoID, data);
    } else {
      registroDeCaixa = registro;
    }

    await listarRegistrosDeCaixa();

    if (registroDeCaixa.abertura == null) {
      caixaAberto = false;
    } else {
      caixaAberto = true;
    }
  }

  gravarAcerturaCaixa() async {
    registroDeCaixa.valorAbertura = valorAbertura;

    await Get.find<SQLiteConnection>().caixaDAO.updateData(registroDeCaixa);
    await listarRegistrosDeCaixa();

    if (registroDeCaixa.abertura == null) {
      caixaAberto = false;
    } else {
      caixaAberto = true;
    }
  }

  fechamentoDeCaixa() async {
    registroDeCaixa.fechamento = DateTime.now().toIso8601String();
    registroDeCaixa.valorFechamento = valorFechamento;

    await Get.find<SQLiteConnection>().caixaDAO.updateData(registroDeCaixa);
    await listarRegistrosDeCaixa();

    if (registroDeCaixa.fechamento == null) {
      caixaAberto = true;
    } else {
      caixaAberto = false;
    }
  }

  postData(CaixaEntity data) async {
    await Get.find<SQLiteConnection>().caixaDAO.insertData(data);
  }

  @override
  onInit() async {
    // await limparCaixa();
    await obterRegistroDeCaixa();
    await listarRegistrosDeCaixa();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
