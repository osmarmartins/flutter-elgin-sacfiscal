import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/numeric_spin_widget.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/produtos_entity.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/vendas_cadastro_controller.dart';

class VendasCadastroDetalhesProdutoWidget extends StatefulWidget {
  final ProdutosEntity produto;
  const VendasCadastroDetalhesProdutoWidget({
    Key? key,
    required this.produto,
  }) : super(key: key);

  @override
  _VendasCadastroDetalhesProdutoWidgetState createState() => _VendasCadastroDetalhesProdutoWidgetState();
}

class _VendasCadastroDetalhesProdutoWidgetState extends State<VendasCadastroDetalhesProdutoWidget> {
  VendasCadastroController controller = Get.find<VendasCadastroController>();

  @override
  void initState() {
    controller.produtoSelecionado = widget.produto;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/images/produtos/${widget.produto.img}',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'R\$ ${widget.produto.preco!.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 150,
                padding: const EdgeInsets.all(5),
                child: NumericSpinWidget(
                  minValue: 0,
                  maxValue: 10,
                  initialValue: 1,
                  onChanged: (val) {
                    controller.produtoSelecionadoQuantidade = val;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
