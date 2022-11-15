import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdvandroid_flutter/application/commons/functions/application_functions.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_responsive_widget.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/components/vendas_cadastro_cupom_item_widget.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/vendas_cadastro_controller.dart';

class VendasCadastroCupom extends StatefulWidget {
  const VendasCadastroCupom({Key? key}) : super(key: key);

  @override
  _VendasCadastroCupomState createState() => _VendasCadastroCupomState();
}

class _VendasCadastroCupomState extends State<VendasCadastroCupom> {
  VendasCadastroController controller = Get.find<VendasCadastroController>();

  @override
  Widget build(BuildContext context) {
    ApplicationResponsiveWidget responsive =
        ApplicationResponsiveWidget(context);

    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Venda',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Obx(
                    () => SizedBox(
                      width: 150,
                      child: Text(
                        controller.venda.id.toString().padLeft(5, '0'),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        '${controller.vendaItem.length} Volumes',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        formatarDataStringISO(
                          controller.venda.dhemi,
                        ),
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
              ),
              Divider(
                color: Colors.white,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(4, 12, 4, 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Descrição',
                    style: TextStyle(
                      fontSize: responsive.diagonalPercentual(1.3),
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  width: responsive.widthPercentual(7),
                  child: Text(
                    'Código',
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
                    'Qtde.',
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
                    'Preço',
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
                    'Total (P)',
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
          ),
          Divider(
            color: Colors.white.withAlpha(60),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(0),
              child: Obx(
                () => ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.vendaItem.length,
                  itemBuilder: (context, i) {
                    return VendasCadastroCupomItemWidget(
                      index: i,
                      item: controller.vendaItem[i],
                    );
                  },
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.white.withAlpha(60),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'Cliente: '),
                            TextSpan(text: 'CLIENTE PADRÃO DE VENDAS'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'Cpf/Cnpj: '),
                            TextSpan(
                              text: '999.9**.**-**',
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'E-mail: '),
                            TextSpan(
                              text: 'clie***********.com.br',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Obx(
                        () {
                          return Text(
                            'Valor Total: R\$ ${controller.totalVenda.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 25,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Deconto: R\$ 0.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
