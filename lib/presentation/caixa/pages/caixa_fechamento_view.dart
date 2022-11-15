import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'package:pdvandroid_flutter/application/commons/theme/cores.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sembast/entity/configuracoes_entity.dart';
import 'package:pdvandroid_flutter/presentation/caixa/caixa_controller.dart';
import 'package:pdvandroid_flutter/presentation/caixa/components/caixa_linha_valor_widget.dart';
import 'package:pdvandroid_flutter/presentation/caixa/components/caixa_linha_widget.dart';

class CaixaFechamentoView extends StatefulWidget {
  const CaixaFechamentoView({Key? key}) : super(key: key);

  @override
  _CaixaFechamentoViewState createState() => _CaixaFechamentoViewState();
}

class _CaixaFechamentoViewState extends State<CaixaFechamentoView> {
  CaixaController controller = Get.find<CaixaController>();
  TextEditingController valorController = TextEditingController();

  @override
  void initState() {
    valorController.text = controller.registroDeCaixa.valorFechamento.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppTheme.corRoxa,
            appBar: AppBar(
              title: Text('Fechamento de Caixa'),
              centerTitle: true,
              backgroundColor: AppTheme.corRoxa.withAlpha(200),
              actions: [
                IconButton(
                  onPressed: () async {
                    controller.valorFechamento = double.parse(valorController.text);
                    await controller.fechamentoDeCaixa();
                    Get.back();
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.save,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(40),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CaixaValorWidget(
                      label: 'Valor Abertura',
                      icon: FontAwesomeIcons.dollarSign,
                      valorController: valorController,
                    ),
                    CaixaLinhaWIdget(
                      label: 'Caixa',
                      identificador: controller.registroDeCaixa.terminal!,
                      valor: 'Caixa M10 Elgin (${controller.registroDeCaixa.terminal})',
                    ),
                    CaixaLinhaWIdget(
                      label: 'Empresa',
                      identificador: '14.200.166/0001-66',
                      valor: 'ELGIN INDUSTRIAL DA AMAZONIA LTDA',
                    ),
                    CaixaLinhaWIdget(
                      label: 'Operador',
                      identificador: controller.registroDeCaixa.idUsuario.toString(),
                      valor: Get.find<ConfigruacoesEntity>().loginUsuario!.toString(),
                    ),
                    CaixaLinhaWIdget(
                      label: 'Data Abertura',
                      identificador: DateFormat('dd/MM/yyyy HH:mm:ss').format(
                          DateTime.parse(controller.registroDeCaixa.abertura ?? DateTime.now().toString()).toLocal()),
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
