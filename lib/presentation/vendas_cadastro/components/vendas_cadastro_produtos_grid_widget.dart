import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdvandroid_flutter/application/commons/functions/application_functions.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_responsive_widget.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/vendas_cadastro_controller.dart';

class VendasCadastroProdutosGridWidget extends StatefulWidget {
  final TabController tabController;
  const VendasCadastroProdutosGridWidget({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  _VendasCadastroProdutosGridWidgetState createState() => _VendasCadastroProdutosGridWidgetState();
}

class _VendasCadastroProdutosGridWidgetState extends State<VendasCadastroProdutosGridWidget> {
  VendasCadastroController controller = Get.find<VendasCadastroController>();

  @override
  Widget build(BuildContext context) {
    ApplicationResponsiveWidget responsive = ApplicationResponsiveWidget(context);

    return Container(
      padding: EdgeInsets.all(0),
      child: GridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        childAspectRatio: (2.5 / 2.5),
        children: controller.listaGrupos.map(
          (item) {
            return InkWell(
              onTap: () async {
                await controller.selecionarGrupo(item.descricao!);
                widget.tabController.animateTo(0);
              },
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: convertHexColorToColor(item.color!)!.withAlpha(195),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.descricao!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withAlpha(220),
                          fontWeight: FontWeight.bold,
                          fontSize: responsive.diagonalPercentual(1.1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
