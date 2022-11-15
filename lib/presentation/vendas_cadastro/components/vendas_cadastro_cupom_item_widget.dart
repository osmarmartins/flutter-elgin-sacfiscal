import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pdvandroid_flutter/application/commons/functions/cancel_focud.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_responsive_widget.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/exports/sqlite_entity_exports.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/vendas_cadastro_controller.dart';

class VendasCadastroCupomItemWidget extends StatefulWidget {
  final int index;
  final VendaItemEntity item;
  const VendasCadastroCupomItemWidget({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  @override
  State<VendasCadastroCupomItemWidget> createState() => _VendasCadastroCupomItemWidgetState();
}

class _VendasCadastroCupomItemWidgetState extends State<VendasCadastroCupomItemWidget> {
  VendasCadastroController controller = Get.find<VendasCadastroController>();

  @override
  Widget build(BuildContext context) {
    ApplicationResponsiveWidget responsive = ApplicationResponsiveWidget(context);
    return Obx(
      () => Dismissible(
        direction: DismissDirection.startToEnd,
        confirmDismiss: (DismissDirection direction) async {
          return false;
        },
        background: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.trash,
                  color: Colors.white,
                  size: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Remover Item',
                    style: TextStyle(
                      fontSize: responsive.diagonalPercentual(1.4),
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        key: Key('item ${widget.index}'),
        child: InkWell(
          onTap: () {
            cancelFocus(context);
            controller.setSelectedListViewItem(widget.index);
          },
          child: ListTile(
            selected: (controller.isSelectedListViewItem) ? (widget.index == controller.selectedListViewItem) : false,
            selectedTileColor: Colors.white.withAlpha(30),
            contentPadding: EdgeInsets.fromLTRB(4, 4, 4, 4),
            dense: false,
            title: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.item.xprod.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: responsive.diagonalPercentual(1.4),
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: responsive.widthPercentual(8),
                      child: Text(
                        widget.item.cprod.toString(),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: responsive.diagonalPercentual(1.4),
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: responsive.widthPercentual(7),
                      child: Text(
                        widget.item.qcom!.toStringAsFixed(2),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: responsive.diagonalPercentual(1.4),
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: responsive.widthPercentual(10),
                      child: Text(
                        widget.item.vuncom!.toStringAsFixed(2),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: responsive.diagonalPercentual(1.4),
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: responsive.widthPercentual(12),
                      child: Text(
                        widget.item.vprod!.toStringAsFixed(2),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: responsive.diagonalPercentual(1.4),
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                //       child: Text(
                //         'Desconto Aplicado: R\$ 0.00',
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.w400,
                //           fontSize: 12,
                //         ),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
