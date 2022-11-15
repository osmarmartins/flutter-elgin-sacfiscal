import 'package:get/get.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/connection/sqlite_connection.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/cliente_entity.dart';

class ClienteController extends GetxController {
  final RxList<ClienteEntity> _listaClientes = RxList<ClienteEntity>();
  final _isLoading = false.obs;

  List<ClienteEntity> get listaClientes => _listaClientes;
  set listaClientes(value) => _listaClientes.value = value;

  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  buscarCliente({
    String campoBusca = '',
  }) async {
    isLoading = true;

    List<ClienteEntity> clientes;

    if (campoBusca.trim() == '') {
      clientes = await Get.find<SQLiteConnection>().clienteDAO.findAll();
    } else {
      clientes = await Get.find<SQLiteConnection>().clienteDAO.findByName(campoBusca.trim());
    }

    _listaClientes.clear();
    _listaClientes.addAll(clientes);

    isLoading = false;
  }

  @override
  onInit() async {
    await buscarCliente();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
