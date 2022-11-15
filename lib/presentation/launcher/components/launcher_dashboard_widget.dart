import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pdvandroid_flutter/application/application_pages.dart';
import 'package:pdvandroid_flutter/application/commons/theme/cores.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_button_widget.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_responsive_widget.dart';
import 'package:pdvandroid_flutter/presentation/launcher/components/launcher_dashboard_tile_widget.dart';
import 'package:pdvandroid_flutter/presentation/launcher/launcher_controller.dart';

class LauncherDashboardWidget extends StatefulWidget {
  const LauncherDashboardWidget({Key? key}) : super(key: key);

  @override
  _LauncherDashboardWidgetState createState() => _LauncherDashboardWidgetState();
}

class _LauncherDashboardWidgetState extends State<LauncherDashboardWidget> {
  LauncherController launcherController = Get.find<LauncherController>();
  @override
  Widget build(BuildContext context) {
    ApplicationResponsiveWidget responsive = ApplicationResponsiveWidget(context);

    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: LauncherTileWIdget(
                        width: responsive.widthPercentual(23),
                        label: 'Vendas',
                        labelSize: 40,
                        color: Colors.purple[800]!,
                        icon: FontAwesomeIcons.shoppingCart,
                        iconSize: responsive.diagonalPercentual(13),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                        ),
                        onTap: () {
                          Get.toNamed(
                            ApplicationRoutes.vendasLista,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: LauncherTileWIdget(
                        width: responsive.widthPercentual(23),
                        label: 'Caixa',
                        labelSize: responsive.diagonalPercentual(2),
                        color: Colors.blue,
                        icon: FontAwesomeIcons.cashRegister,
                        iconSize: responsive.diagonalPercentual(6),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                        ),
                        onTap: () {
                          Get.toNamed(ApplicationRoutes.caixa);
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: LauncherTileWIdget(
                        width: responsive.widthPercentual(23),
                        label: 'Clientes',
                        labelSize: responsive.diagonalPercentual(2),
                        color: Colors.blue,
                        icon: FontAwesomeIcons.user,
                        iconSize: responsive.diagonalPercentual(6),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                        ),
                        onTap: () {
                          Get.toNamed(ApplicationRoutes.cliente);
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: LauncherTileWIdget(
                        width: responsive.widthPercentual(23),
                        label: 'Produtos',
                        labelSize: responsive.diagonalPercentual(2),
                        color: Colors.blue,
                        icon: FontAwesomeIcons.box,
                        iconSize: responsive.diagonalPercentual(6),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                        ),
                        onTap: () {
                          Get.toNamed(ApplicationRoutes.produto);
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: LauncherTileWIdget(
                        width: responsive.widthPercentual(23),
                        label: 'Formas de Pagamento',
                        labelSize: responsive.diagonalPercentual(2),
                        color: Colors.blue,
                        icon: FontAwesomeIcons.creditCard,
                        iconSize: responsive.diagonalPercentual(6),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                        ),
                        onTap: () {
                          Get.toNamed(ApplicationRoutes.formaPagamento);
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: LauncherTileWIdget(
                        width: responsive.widthPercentual(23),
                        label: 'Configurações',
                        labelSize: responsive.diagonalPercentual(2),
                        color: Colors.blue,
                        icon: FontAwesomeIcons.cogs,
                        iconSize: responsive.diagonalPercentual(6),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: LauncherTileWIdget(
                        width: responsive.widthPercentual(23),
                        label: 'Empresas',
                        labelSize: responsive.diagonalPercentual(2),
                        color: Colors.blue,
                        icon: FontAwesomeIcons.building,
                        iconSize: responsive.diagonalPercentual(6),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(0),
                        ),
                        onTap: () {
                          Get.toNamed(ApplicationRoutes.empresas);
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: LauncherTileWIdget(
                        width: responsive.widthPercentual(23),
                        label: 'Sair',
                        labelSize: responsive.diagonalPercentual(2),
                        color: Colors.blue,
                        icon: FontAwesomeIcons.doorOpen,
                        iconSize: responsive.diagonalPercentual(6),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(40),
                        ),
                        onTap: () {
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
                            backgroundColor: AppTheme.corRoxa.withAlpha(240),
                            content: Container(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Text(
                                'Deseja realmente retornar ao login?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            cancel: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                                },
                              ),
                            ),
                            confirm: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
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
                                  launcherController.efetuarLogoff();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  return Text(
                    'Endereço de IP: ${launcherController.ipCaixa} (IPV4)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  );
                }),
                Text(
                  'Copyright 2021 Claudney Sarti Sessa / Elgin',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                Text(
                  'claudneysartisessa@gmail.com',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
