import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pdvandroid_flutter/presentation/vendas_lista/vendas_lista_controller.dart';

import '../../application//commons//helpers/string_helpers.dart';

import 'package:pdvandroid_flutter/application/commons/theme/cores.dart';

class VendasListaView extends StatefulWidget {
  const VendasListaView({Key? key}) : super(key: key);

  @override
  _VendasListaViewState createState() => _VendasListaViewState();
}

class _VendasListaViewState extends State<VendasListaView> with RouteAware {
  VendasListaController controller = Get.find<VendasListaController>();
  TextEditingController buscaController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Get.find<RouteObserver>().subscribe(
      this,
      ModalRoute.of(context) as PageRoute,
    );
  }

  @override
  void didPushNext() {
    // controller.drawerKey.currentState!.closeDrawer();
  }

  @override
  void didPopNext() {
    // Get.find<GlobalDashboardController>().carregarVendas();
    controller.listarVendas();
  }

  @override
  void dispose() {
    Get.find<RouteObserver>().unsubscribe(this);
    super.dispose();
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
              title: Text('Vendas do Dia'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () async {
                    await controller.incluirVenda();
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.plus,
                  ),
                )
              ],
              backgroundColor: AppTheme.corRoxa.withAlpha(200),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                      child: Obx(() {
                        return ListView.separated(
                          itemCount: controller.listaVendas.length,
                          separatorBuilder: (context, i) {
                            return Divider(
                              color: Colors.white.withAlpha(80),
                              height: 10,
                            );
                          },
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () async {
                                if (controller.listaVendas[i].vliq == null ||
                                    controller.listaVendas[i].vliq == 0) {
                                  await controller.abrirVenda(
                                      controller.listaVendas[i].id!);
                                }
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Cliente Padrão',
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          controller.listaVendas[i].id!
                                              .toString()
                                              .padLeft(5, '0'),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  (controller.listaVendas[i].vliq == null ||
                                          controller.listaVendas[i].vliq == 0)
                                      ? Text(
                                          'Venda em aberto',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          'Venda Concluída',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.greenAccent,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              (controller.listaVendas[i]
                                                          .cpfdest !=
                                                      null)
                                                  ? 'Cpf/Cnpj: ${controller.listaVendas[i].cpfdest!.toBrazilianCpfCnpj()}'
                                                  : 'Cliente Não Identificado',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 250,
                                        child: Text(
                                          controller.listaVendas[i].dhemi
                                              .toString(),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Valor da Venda: ${controller.listaVendas[i].vprod!.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Valor Pago: ${(controller.listaVendas[i].vliq ?? 0).toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Obx(() {
                              return Text(
                                'Total: R\$ ${controller.totalGeralVendas.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    )
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
