import 'package:get/get.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/connection/sqlite_connection.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/produtos_entity.dart';

class ProdutosController extends GetxController {
  final RxList<ProdutosEntity> _listaProdutos = RxList<ProdutosEntity>();
  final _isLoading = false.obs;

  List<ProdutosEntity> get listaProdutos => _listaProdutos;
  set listaProdutos(value) => _listaProdutos.value = value;

  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  buscarProdutos({
    String campoBusca = '',
  }) async {
    isLoading = true;

    List<ProdutosEntity> produtos;

    if (campoBusca.trim() == '') {
      produtos = await Get.find<SQLiteConnection>().produtoDAO.findAll();
    } else {
      produtos = await Get.find<SQLiteConnection>().produtoDAO.findByName(campoBusca.trim());
    }

    _listaProdutos.clear();
    _listaProdutos.addAll(produtos);

    isLoading = false;
  }

  @override
  onInit() async {
    await buscarProdutos();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
