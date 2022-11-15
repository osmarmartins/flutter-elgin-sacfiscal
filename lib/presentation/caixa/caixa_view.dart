import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pdvandroid_flutter/application/application_pages.dart';
import 'package:pdvandroid_flutter/application/commons/functions/application_functions.dart';

import 'package:pdvandroid_flutter/application/commons/theme/cores.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sembast/entity/configuracoes_entity.dart';
import 'package:pdvandroid_flutter/presentation/caixa/caixa_controller.dart';

class CaixaView extends StatefulWidget {
  const CaixaView({Key? key}) : super(key: key);

  @override
  _CaixaViewState createState() => _CaixaViewState();
}

class _CaixaViewState extends State<CaixaView> {
  CaixaController controller = Get.find<CaixaController>();

  @override
  void initState() {
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
              title: Text('Controle de Caixa'),
              centerTitle: true,
              backgroundColor: AppTheme.corRoxa.withAlpha(200),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Obx(
                            () => controller.caixaAberto
                                ? FittedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(30),
                                      child: FaIcon(
                                        FontAwesomeIcons.thumbsUp,
                                        size: 180,
                                        color: Colors.green,
                                      ),
                                    ),
                                  )
                                : FittedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(30),
                                      child: FaIcon(
                                        FontAwesomeIcons.infoCircle,
                                        size: 180,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.caixaAberto
                                ? 'Caixa Aberto'
                                : 'Caixa Inativo',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'Operador'),
                              TextSpan(text: ' - '),
                              TextSpan(
                                  text: Get.find<ConfigruacoesEntity>()
                                      .loginUsuario!
                                      .toUpperCase()),
                            ],
                          ),
                        ),
                        Text(
                          converterDataParaString(DateTime.now()),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(
                                () {
                                  return controller.caixaAberto
                                      ? Padding(
                                          padding: const EdgeInsets.all(28.0),
                                          child: SizedBox(
                                            height: 50,
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                Get.toNamed(ApplicationRoutes
                                                    .caixaFechamento);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.orange,
                                              ),
                                              child:
                                                  Text('Fechamento de Caixa'),
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(28.0),
                                          child: SizedBox(
                                            height: 50,
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                await controller
                                                    .obterRegistroDeCaixa(
                                                  abrirCaixa: true,
                                                );
                                                Get.toNamed(ApplicationRoutes
                                                    .caixaAbertura);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.purple[900],
                                              ),
                                              child: Text('Abertura de Caixa'),
                                            ),
                                          ),
                                        );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Obx(
                        () => ListView.separated(
                          separatorBuilder: (context, i) {
                            return Divider(
                              color: Colors.white,
                            );
                          },
                          itemCount: controller.listaCaixa.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.listaCaixa[i].abertura == null
                                        ? 'Registro Pendente (${controller.listaCaixa[i].id})'
                                        : controller.listaCaixa[i].fechamento !=
                                                null
                                            ? 'Registro Fechado (${controller.listaCaixa[i].id})'
                                            : 'Registro Aberto (${controller.listaCaixa[i].id})',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.white.withAlpha(100),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'Data de Abertura: '),
                                        TextSpan(
                                            text: controller.listaCaixa[i]
                                                        .abertura !=
                                                    null
                                                ? converterDataParaString(
                                                    converterDataISOParaDateTime(
                                                      controller.listaCaixa[i]
                                                          .abertura!,
                                                    ).toLocal(),
                                                  )
                                                : ''),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'Valor de Abertura: '),
                                        TextSpan(
                                            text: controller.listaCaixa[i]
                                                        .valorAbertura !=
                                                    null
                                                ? controller.listaCaixa[i]
                                                    .valorAbertura!
                                                    .toStringAsFixed(2)
                                                : ''),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'Data de Fechamento: '),
                                        TextSpan(
                                          text: controller.listaCaixa[i]
                                                      .fechamento !=
                                                  null
                                              ? converterDataParaString(
                                                  converterDataISOParaDateTime(
                                                    controller.listaCaixa[i]
                                                        .fechamento!,
                                                  ).toLocal(),
                                                )
                                              : '',
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'Valor de Fechamento: '),
                                        TextSpan(
                                          text: controller.listaCaixa[i]
                                                      .valorFechamento !=
                                                  null
                                              ? controller.listaCaixa[i]
                                                  .valorFechamento!
                                                  .toStringAsFixed(2)
                                              : '',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
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
