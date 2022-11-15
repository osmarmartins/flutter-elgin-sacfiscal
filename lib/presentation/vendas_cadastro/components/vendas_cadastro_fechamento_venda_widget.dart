import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_responsive_widget.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/vendas_cadastro_controller.dart';

class VendasCadastroFechamentoVendaWidget extends StatefulWidget {
  const VendasCadastroFechamentoVendaWidget({
    Key? key,
  }) : super(key: key);

  @override
  _VendasCadastroFechamentoVendaWidgetState createState() =>
      _VendasCadastroFechamentoVendaWidgetState();
}

class _VendasCadastroFechamentoVendaWidgetState
    extends State<VendasCadastroFechamentoVendaWidget> {
  VendasCadastroController controller = Get.find<VendasCadastroController>();
  final keyboardVisibilityController = KeyboardVisibilityController();

  @override
  void initState() {
    keyboardVisibilityController.onChange.listen(
      (bool visible) {
        controller.setKeyboardVisible(visible);
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ApplicationResponsiveWidget responsive =
        ApplicationResponsiveWidget(context);

    return KeyboardDismisser(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.transparent,
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 180,
                          height: 48,
                          margin: EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(80),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Total Venda',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: responsive.diagonalPercentual(1.3),
                          ),
                          readOnly: true,
                          initialValue:
                              controller.totalVenda.toStringAsFixed(2),
                          keyboardType: TextInputType.number,
                          onChanged: (text) async {},
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.all(
                                responsive.heightPercentual(2.5)),
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
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 180,
                          height: 48,
                          margin: EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(80),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Em Dinheiro',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: responsive.diagonalPercentual(1.3),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (text) async {
                            controller.valorPago = double.parse(text);
                          },
                          validator: (value) {
                            if (double.parse(value!) < controller.totalVenda) {
                              return 'Valor Inválido para o pagamento';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.all(
                                responsive.heightPercentual(2.5)),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
