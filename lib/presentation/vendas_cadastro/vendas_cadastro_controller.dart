import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/connection/sqlite_connection.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/produtos_grupos_entity.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/produtos_entity.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/venda_entity.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/venda_item_entity.dart';

class VendasCadastroController extends GetxController {
  final _selectedListViewItem = 0.obs;
  final _isSelectedListViewItem = false.obs;
  final _isKeyboardVisible = false.obs;
  final _selectedEdit = false.obs;
  final _totalVenda = 0.0.obs;
  final _valorPago = 0.0.obs;
  final _listaIsLoading = true.obs;
  final _produtoSelecionadoQuantidade = 1.obs;
  final _grupo = ''.obs;

  final formKey = GlobalKey<FormState>();

  final RxList<ProdutosEntity> _listaProdutos = RxList<ProdutosEntity>();
  final RxList<ProdutosGrupoEntity> _listaGrupos = RxList<ProdutosGrupoEntity>();
  final Rx<ProdutosEntity> _produtoSelecionado = Rx<ProdutosEntity>(ProdutosEntity());
  final Rx<VendaEntity> _venda = Rx<VendaEntity>(VendaEntity());
  final RxList<VendaItemEntity> vendaItem = RxList<VendaItemEntity>();

  int get selectedListViewItem => _selectedListViewItem.value;
  set selectedListViewItem(value) => _selectedListViewItem.value = value;

  bool get isSelectedListViewItem => _isSelectedListViewItem.value;
  set isSelectedListViewItem(value) => _isSelectedListViewItem.value = value;

  bool get isKeyboardVisible => _isKeyboardVisible.value;
  set isKeyboardVisible(value) => _isKeyboardVisible.value = value;

  bool get selectedEdit => _selectedEdit.value;
  set selectedEdit(value) => _selectedEdit.value = value;

  double get totalVenda => _totalVenda.value;
  set totalVenda(value) => _totalVenda.value = value;

  double get valorPago => _valorPago.value;
  set valorPago(value) => _valorPago.value = value;

  bool get listaIsLoading => _listaIsLoading.value;
  set listaIsLoading(value) => _listaIsLoading.value = value;

  ProdutosEntity get produtoSelecionado => _produtoSelecionado.value;
  set produtoSelecionado(value) => _produtoSelecionado.value = value;

  int get produtoSelecionadoQuantidade => _produtoSelecionadoQuantidade.value;
  set produtoSelecionadoQuantidade(value) => _produtoSelecionadoQuantidade.value = value;

  List<ProdutosEntity> get listaProdutos => _listaProdutos;
  set listaProdutos(value) => _listaProdutos.value = value;

  List<ProdutosGrupoEntity> get listaGrupos => _listaGrupos;
  set listaGrupos(value) => _listaGrupos.value = value;

  VendaEntity get venda => _venda.value;
  set venda(value) => _venda.value = value;

  get grupo => _grupo.value;
  set grupo(value) => _grupo.value = value;

  selecionarGrupo(String value) {
    grupo = value;
    carregarLista();
  }

  limparGrupo() {
    grupo = '';
  }

  finalizarVenda(double vliq) async {
    venda.nfat = 'fechada';
    venda.vliq = vliq;
    await Get.find<SQLiteConnection>().vendaDAO.updateData(venda);
  }

  iniciarVenda(VendaEntity? value) async {
    venda = value!;
    var listaItensVenda = await Get.find<SQLiteConnection>().vendaItemDAO.getById(venda.id!);
    vendaItem.clear();
    vendaItem.addAll(listaItensVenda);
    totalizarVenda();
  }

  void setKeyboardVisible(bool value) {
    _isKeyboardVisible.value = value;
  }

  void setSelectedListViewItem(value) {
    if (selectedListViewItem == value) {
      isSelectedListViewItem = false;
      selectedListViewItem = -1;
    } else {
      isSelectedListViewItem = true;
      selectedListViewItem = value;
    }
  }

  void setSelectedEdit(value) {
    selectedEdit = value;
  }

  Future<bool> carregarLista({
    String descricao = '',
  }) async {
    listaIsLoading = true;
    try {
      listaProdutos.clear();
      if (descricao == '') {
        List<ProdutosEntity>? lista;
        if (grupo == '') {
          lista = await Get.find<SQLiteConnection>().produtoDAO.findAll();
        } else {
          lista = await Get.find<SQLiteConnection>().produtoDAO.findAllByGrupo(grupo);
        }

        _listaProdutos.addAll(lista);
      } else {
        var lista = await Get.find<SQLiteConnection>().produtoDAO.findByText(descricao, grupo);
        _listaProdutos.addAll(lista);
      }

      listaGrupos.clear();
      var grupos = await Get.find<SQLiteConnection>().produtoGrupoDAO.obterGrupos();
      _listaGrupos.addAll(grupos);

      listaIsLoading = false;
    } catch (e) {
      listaIsLoading = true;
    }
    return true;
  }

  incluirProdutoVenda() async {
    double total = produtoSelecionadoQuantidade.toDouble() * produtoSelecionado.preco!.toDouble();

    VendaItemEntity itemVenda = VendaItemEntity(
      idVenda: venda.id,
      cprod: produtoSelecionado.id.toString(),
      xprod: produtoSelecionado.descricao,
      cfop: int.parse(produtoSelecionado.cfop!),
      cest: produtoSelecionado.cest,
      qcom: produtoSelecionadoQuantidade.toDouble(),
      cean: produtoSelecionado.gtin,
      vunid: produtoSelecionado.preco,
      ucom: produtoSelecionado.un,
      vuncom: produtoSelecionado.preco,
      vprod: (total).toDouble(),
      ceantrib: produtoSelecionado.gtin,
      utrib: produtoSelecionado.un,
      vuntrib: produtoSelecionado.preco,
      csticms: produtoSelecionado.cstIcms,
      picms: produtoSelecionado.aliqIcms,
      vbcicms: 0,
      vicms: 0,
      cstpis: produtoSelecionado.cstPis,
      vpis: 0,
      cstcofins: produtoSelecionado.cstCofins,
      pcofins: produtoSelecionado.aliqCofins,
      vcofins: 0,
      vfrete: 0,
      vdesc: 0,
      voutro: 0,
      vseg: 0,
    );

    try {
      vendaItem.add(itemVenda);

      await Get.find<SQLiteConnection>().vendaItemDAO.insertData(itemVenda);
    } finally {
      produtoSelecionadoQuantidade = 1;
      totalizarVenda();
    }
  }

  totalizarVenda() async {
    totalVenda = 0.0;
    for (var item in vendaItem) {
      totalVenda += item.vprod!.toDouble();
    }
    venda.vprod = totalVenda;
    venda.vnf = totalVenda;
    await Get.find<SQLiteConnection>().vendaDAO.updateData(venda);
  }

  @override
  onInit() async {
    super.onInit();
    selectedListViewItem = -1;
    await carregarLista();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
