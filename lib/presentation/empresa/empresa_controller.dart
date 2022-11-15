import 'package:get/get.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/connection/sqlite_connection.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/empresa_entity.dart';

class EmpresaController extends GetxController {
  final RxList<EmpresaEntity> _listaEmpresas = RxList<EmpresaEntity>();
  final _isLoading = false.obs;

  List<EmpresaEntity> get listaEmpresas => _listaEmpresas;
  set listaEmpresas(value) => _listaEmpresas.value = value;

  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  buscarEmpresa({
    String campoBusca = '',
  }) async {
    isLoading = true;

    List<EmpresaEntity> empresas;

    if (campoBusca.trim() == '') {
      empresas = await Get.find<SQLiteConnection>().empresaDAO.findAll();
    } else {
      empresas = await Get.find<SQLiteConnection>().empresaDAO.findByName(campoBusca.trim());
    }

    _listaEmpresas.clear();
    _listaEmpresas.addAll(empresas);

    isLoading = false;
  }

  @override
  onInit() async {
    buscarEmpresa();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
