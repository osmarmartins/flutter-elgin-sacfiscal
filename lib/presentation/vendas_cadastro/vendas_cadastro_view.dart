import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pdvandroid_flutter/application/commons/functions/cancel_focud.dart';
import 'package:pdvandroid_flutter/application/commons/theme/cores.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_button_widget.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_responsive_widget.dart';
import 'package:pdvandroid_flutter/infrastructure/services/elgin/elgin_m10_printes_helpers.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/venda_entity.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/components/vendas_cadastro_consulta_produtos_widget.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/components/vendas_cadastro_cupom_widget.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/components/vendas_cadastro_fechamento_venda_widget.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/vendas_cadastro_controller.dart';

import 'package:pdvandroid_flutter/application/commons/functions/nfce_funcoes.dart';
import 'package:pdvandroid_flutter/infrastructure/services/elgin/elgin_m10_printer_service.dart';

class VendasCadastroView extends StatefulWidget {
  final VendaEntity vendaCadastro;

  const VendasCadastroView({
    Key? key,
    required this.vendaCadastro,
  }) : super(key: key);

  @override
  _VendasCadastroViewState createState() => _VendasCadastroViewState();
}

class _VendasCadastroViewState extends State<VendasCadastroView>
    with TickerProviderStateMixin {
  VendasCadastroController controller = Get.find<VendasCadastroController>();
  TextEditingController textController = TextEditingController();
  final keyboardVisibilityController = KeyboardVisibilityController();
  final FocusNode _focus = FocusNode();
  late TabController tabController;
  TextEditingController inputMessage =
      TextEditingController(text: 'ELGIN DEVELOPERS COMMUNITY');
  ElginM10PrinterService printerService = ElginM10PrinterService();

  @override
  void initState() {
    super.initState();
    controller.iniciarVenda(widget.vendaCadastro);
    tabController = TabController(
      length: 2,
      vsync: this,
    );

    void _onFocusChange() {
      controller.setSelectedEdit(_focus.hasFocus);
    }

    _focus.addListener(_onFocusChange);

    keyboardVisibilityController.onChange.listen((bool visible) {
      controller.setKeyboardVisible(visible);
      if (visible == false) {
        if (controller.selectedEdit == true) {
          cancelFocus(context);
        }
      }
    });

    tabController.index = 0;
  }

  imprimirCupom(double valorPago) async {
    await controller.finalizarVenda(valorPago);

    var xml = nfceGerarXML(controller.venda, controller.vendaItem);
    await printerService.verificarStatusDoChannel('Meu Teste do Channel');
    await printerService.abrirConexaoInterna();
    await printerService.verificarStatusImpressora();
    await printerService.imprimirXmlNFCe(
      xml,
      param: ImprimirXmlNFCeParam.param0001.value,
    );
    await printerService.avancarLinhas(10);
    await printerService.cortarPapel(10);
  }

  @override
  Widget build(BuildContext context) {
    ApplicationResponsiveWidget responsive =
        ApplicationResponsiveWidget(context);

    return WillPopScope(
      onWillPop: () async {
        if (controller.selectedEdit == true) {
          cancelFocus(context);
        }
        return false;
      },
      child: SafeArea(
        child: KeyboardDismisser(
          child: Obx(
            () => Scaffold(
              resizeToAvoidBottomInset: controller.selectedEdit,
              backgroundColor: AppTheme.corRoxa,
              body: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Visibility(
                      visible: !controller.selectedEdit,
                      maintainSize: false,
                      maintainState: false,
                      replacement: Container(),
                      child: SizedBox(
                        height: responsive.heightPercentual(10),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    //DIALOG

                                    Get.defaultDialog(
                                      title: 'Sair',
                                      titlePadding: EdgeInsets.all(10),
                                      onWillPop: () async {
                                        return false;
                                      },
                                      titleStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                      backgroundColor:
                                          AppTheme.corRoxa.withAlpha(240),
                                      content: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 0, 30, 0),
                                        child: Text(
                                          'Deseja realmente abandonar a venda?',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      cancel: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 0, 30, 0),
                                        child: ApplicationButtonWidget(
                                          child: Text(
                                            'Não',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          color: Colors.green,
                                          invertColor: false,
                                          onTap: () {
                                            Get.back();
                                            cancelFocus(context);
                                          },
                                        ),
                                      ),
                                      confirm: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 0, 30, 30),
                                        child: ApplicationButtonWidget(
                                          child: Text(
                                            'Sim',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          color: Colors.red,
                                          invertColor: false,
                                          onTap: () {
                                            Get.back();
                                            Get.back();
                                            cancelFocus(context);
                                          },
                                        ),
                                      ),
                                    );

                                    //DIALOG
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.arrowLeft,
                                    color: Colors.white,
                                    size: responsive.diagonalPercentual(1.3),
                                  ),
                                ),
                                Expanded(
                                  child: Image.asset(
                                    'assets/images/logo_em_linha.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                SizedBox(
                                  width: responsive.widthPercentual(26),
                                  child: TabBar(
                                    labelColor: Colors.white,
                                    indicatorColor: Colors.blue,
                                    unselectedLabelColor:
                                        Colors.white.withAlpha(100),
                                    controller: tabController,
                                    tabs: [
                                      Padding(
                                        padding: EdgeInsets.all(2),
                                        child: Text('PESQUISA'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(2),
                                        child: Text('GRUPOS'),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: responsive.widthPercentual(37),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton.icon(
                                        onPressed: () async {
                                          //DIALOG

                                          cancelFocus(context);

                                          Get.defaultDialog(
                                            title: 'Fechamento de Venda',
                                            titlePadding: EdgeInsets.all(5),
                                            onWillPop: () async {
                                              return false;
                                            },
                                            titleStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                            ),
                                            backgroundColor:
                                                AppTheme.corRoxa.withAlpha(200),
                                            content: Column(
                                              children: [
                                                VendasCadastroFechamentoVendaWidget(),
                                                Obx(
                                                  () => Visibility(
                                                    visible: (controller
                                                            .isKeyboardVisible ==
                                                        false),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0),
                                                      child:
                                                          ApplicationButtonWidget(
                                                        child: Text(
                                                          'Cancelar',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                    ),
                                                  ),
                                                ),
                                                Obx(
                                                  () => Visibility(
                                                    visible: (controller
                                                            .isKeyboardVisible ==
                                                        false),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0),
                                                      child:
                                                          ApplicationButtonWidget(
                                                        child: Text(
                                                          'Finalizar',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        color: Colors.green,
                                                        invertColor: false,
                                                        onTap: () async {
                                                          if (controller.formKey
                                                              .currentState!
                                                              .validate()) {
                                                            await imprimirCupom(
                                                                controller
                                                                    .valorPago);
                                                            Get.back();
                                                            Get.back();
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            // cancel: ,
                                            // confirm: ,
                                          );

                                          //DIALOG
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.creditCard,
                                          color: Colors.white,
                                          size:
                                              responsive.diagonalPercentual(2),
                                        ),
                                        label: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Finalizar Venda',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: responsive
                                                  .diagonalPercentual(1.4),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            controller.selectedListViewItem !=
                                                -1,
                                        child: TextButton.icon(
                                          onPressed: () {},
                                          icon: Icon(
                                            FontAwesomeIcons.percent,
                                            color: Colors.white,
                                            size: responsive
                                                .diagonalPercentual(2),
                                          ),
                                          label: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'DESCONTO',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: responsive
                                                    .diagonalPercentual(1.4),
                                              ),
                                            ),
                                          ),
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
                    Visibility(
                      visible: !controller.selectedEdit,
                      maintainSize: false,
                      maintainState: false,
                      replacement: Container(),
                      child: Expanded(
                        flex: 8,
                        child: Container(
                          padding: EdgeInsets.all(0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: VendasCadastroConsultaProdutosWidget(
                                  tabController: tabController,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: VendasCadastroCupom(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
