import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pdvandroid_flutter/application/commons/functions/cancel_focud.dart';

import 'package:pdvandroid_flutter/application/commons/theme/cores.dart';
import 'package:pdvandroid_flutter/application/commons/helpers/string_helpers.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_responsive_widget.dart';
import 'package:pdvandroid_flutter/presentation/empresa/empresa_controller.dart';
import 'package:pdvandroid_flutter/presentation/launcher/launcher_controller.dart';

class EmpresaView extends StatefulWidget {
  const EmpresaView({Key? key}) : super(key: key);

  @override
  _EmpresaViewState createState() => _EmpresaViewState();
}

class _EmpresaViewState extends State<EmpresaView> {
  LauncherController controller = Get.find<LauncherController>();
  TextEditingController buscaController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EmpresaController controller = Get.find<EmpresaController>();
    ApplicationResponsiveWidget responsive = ApplicationResponsiveWidget(context);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppTheme.corRoxa,
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.building,
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Empresas'),
              ],
            ),
            centerTitle: true,
            backgroundColor: AppTheme.corRoxa.withAlpha(200),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
                child: TextFormField(
                  controller: buscaController,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: responsive.diagonalPercentual(1.3),
                  ),
                  onChanged: (text) async {
                    controller.buscarEmpresa(
                      campoBusca: text,
                    );
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Pesquisa',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.diagonalPercentual(1.5),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                    alignLabelWithHint: true,
                    hintText: 'Entre com os dados da Empresa',
                    hintStyle: TextStyle(
                      color: Colors.white.withAlpha(180),
                    ),
                    contentPadding: EdgeInsets.all(responsive.heightPercentual(2.5)),
                    suffixIcon: Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
                      child: IconButton(
                        onPressed: () async {
                          buscaController.clear();
                          controller.buscarEmpresa();
                          cancelFocus(context);
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Obx(() {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: controller.listaEmpresas.length,
                      separatorBuilder: (context, i) {
                        return Divider(
                          color: Colors.white.withAlpha(150),
                          height: 5,
                        );
                      },
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {},
                          child: ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Código: ${controller.listaEmpresas[i].id.toString().padLeft(5, '0')}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  controller.listaEmpresas[i].nome!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'Cpj/Cnpj: ${controller.listaEmpresas[i].cnpj!.toBrazilianCpfCnpj()}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
