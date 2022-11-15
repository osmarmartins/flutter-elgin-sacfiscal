import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdvandroid_flutter/application/commons/theme/cores.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_responsive_widget.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sembast/entity/configuracoes_entity.dart';
import 'package:pdvandroid_flutter/presentation/launcher/components/launcher_dashboard_widget.dart';
import 'package:pdvandroid_flutter/presentation/launcher/launcher_controller.dart';

class LauncherView extends StatefulWidget {
  const LauncherView({Key? key}) : super(key: key);

  @override
  _LauncherViewState createState() => _LauncherViewState();
}

class _LauncherViewState extends State<LauncherView> {
  LauncherController controller = Get.find<LauncherController>();

  @override
  void initState() {
    printIps();
    super.initState();
  }

  Future printIps() async {
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.type.name.toUpperCase() == 'IPV4') {
          controller.ipCaixa = addr.address;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    ApplicationResponsiveWidget responsive =
        ApplicationResponsiveWidget(context);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppTheme.corRoxa,
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: responsive.widthPercentual(25),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                'assets/images/logo_sacfiscal_elgin_branco3.fw.png',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Caixa: ',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  Get.find<ConfigruacoesEntity>()
                                      .caixa!
                                      .toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'NOME: ${Get.find<ConfigruacoesEntity>().loginUsuario!.toUpperCase()}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Último login em: ${DateFormat('dd/MM/yyyy hh:mm:ss').format(DateTime.parse(Get.find<ConfigruacoesEntity>().dataUltimoAcesso!).toLocal()).toString()}',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: LauncherDashboardWidget(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
