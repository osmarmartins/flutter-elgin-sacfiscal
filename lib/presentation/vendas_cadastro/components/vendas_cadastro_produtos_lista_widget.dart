import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pdvandroid_flutter/application/commons/functions/cancel_focud.dart';
import 'package:pdvandroid_flutter/application/commons/theme/cores.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_button_widget.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_responsive_widget.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/vendas_cadastro_controller.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/components/vendas_cadastro_detalhes_produto_widget.dart';

class VendasCadastroProdutosListaWidget extends StatefulWidget {
  const VendasCadastroProdutosListaWidget({Key? key}) : super(key: key);

  @override
  _VendasCadastroProdutosListaWidgetState createState() =>
      _VendasCadastroProdutosListaWidgetState();
}

class _VendasCadastroProdutosListaWidgetState
    extends State<VendasCadastroProdutosListaWidget> {
  VendasCadastroController controller = Get.find<VendasCadastroController>();
  TextEditingController pesquisaProduto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ApplicationResponsiveWidget responsive =
        ApplicationResponsiveWidget(context);

    return Container(
      padding: EdgeInsets.all(responsive.diagonalPercentual(0.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: responsive.heightPercentual(0.8),
          ),
          Container(
            padding: EdgeInsets.all(responsive.heightPercentual(0.4)),
            child: TextFormField(
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.diagonalPercentual(1.3),
              ),
              controller: pesquisaProduto,
              onChanged: (text) async {
                await controller.carregarLista(
                  descricao: text,
                );
              },
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Produto',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: responsive.diagonalPercentual(1.5),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
                alignLabelWithHint: true,
                hintText: 'Entre com os dados do produto',
                hintStyle: TextStyle(
                  color: Colors.white.withAlpha(180),
                ),
                contentPadding:
                    EdgeInsets.all(responsive.heightPercentual(2.5)),
                suffixIcon: Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
                  child: IconButton(
                    onPressed: () async {
                      pesquisaProduto.clear();
                      controller.limparGrupo();
                      await controller.carregarLista();
                    },
                    icon: Icon(
                      FontAwesomeIcons.eraser,
                      color: Colors.white.withAlpha(180),
                      size: responsive.diagonalPercentual(1.3),
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  gapPadding: 0,
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderSide: BorderSide(
                    color: Colors.white.withAlpha(80),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Obx(
            () {
              return Visibility(
                visible: (controller.grupo != ''),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 15),
                  child: Text(
                    'Grupo: ${controller.grupo}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              height: 10,
              thickness: 1,
              color: Colors.white.withAlpha(250),
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.listaIsLoading == true
                  ? Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Carregando...',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(5),
                      child: ListView(
                        shrinkWrap: true,
                        children: controller.listaProdutos.map(
                          (produto) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    //DIALOG

                                    cancelFocus(context);

                                    Get.defaultDialog(
                                      title: produto.descricao!,
                                      titlePadding: EdgeInsets.all(1),
                                      onWillPop: () async {
                                        return false;
                                      },
                                      titleStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                      backgroundColor:
                                          AppTheme.corRoxa.withAlpha(200),
                                      content:
                                          VendasCadastroDetalhesProdutoWidget(
                                        produto: produto,
                                      ),
                                      cancel: ApplicationButtonWidget(
                                        child: Text(
                                          'Cancelar',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        color: Colors.red,
                                        invertColor: false,
                                        onTap: () {
                                          cancelFocus(context);
                                          Get.back();
                                        },
                                      ),
                                      confirm: ApplicationButtonWidget(
                                        child: Text(
                                          'Incluir',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        color: Colors.green,
                                        invertColor: false,
                                        onTap: () async {
                                          await controller
                                              .incluirProdutoVenda();
                                          Get.back();
                                        },
                                      ),
                                    );

                                    //DIALOG
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    width: double.infinity,
                                    height: responsive.heightPercentual(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withAlpha(20),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        children: [
                                          Container(
                                            width:
                                                responsive.heightPercentual(17),
                                            padding: const EdgeInsets.all(8),
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.white.withAlpha(80),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: produto.img == ''
                                                        ? Icon(
                                                            FontAwesomeIcons
                                                                .ban,
                                                            size: 55,
                                                            color: Colors
                                                                .red[900]!
                                                                .withAlpha(150),
                                                          )
                                                        : Image.asset(
                                                            'assets/images/produtos/${produto.img}',
                                                            fit: BoxFit.cover,
                                                          ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: responsive
                                                .heightPercentual(1.5),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  produto.descricao!,
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: responsive
                                                        .diagonalPercentual(
                                                            1.5),
                                                  ),
                                                ),
                                                Text(
                                                  'Grupo: ${produto.grupo}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: responsive
                                                        .diagonalPercentual(1),
                                                  ),
                                                ),
                                                Divider(),
                                                Text(
                                                  'Preço: R\$ ${produto.preco!.toStringAsFixed(2)}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: responsive
                                                        .diagonalPercentual(1),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
