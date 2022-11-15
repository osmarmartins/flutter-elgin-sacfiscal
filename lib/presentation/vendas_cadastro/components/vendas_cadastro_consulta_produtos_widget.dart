import 'package:flutter/material.dart';

import 'package:pdvandroid_flutter/presentation/vendas_cadastro/components/vendas_cadastro_produtos_grid_widget.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/components/vendas_cadastro_produtos_lista_widget.dart';

class VendasCadastroConsultaProdutosWidget extends StatefulWidget {
  final TabController tabController;
  const VendasCadastroConsultaProdutosWidget({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  _VendasCadastroConsultaProdutosWidgetState createState() => _VendasCadastroConsultaProdutosWidgetState();
}

class _VendasCadastroConsultaProdutosWidgetState extends State<VendasCadastroConsultaProdutosWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: DefaultTabController(
          length: 2,
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: widget.tabController,
            children: [
              VendasCadastroProdutosListaWidget(),
              VendasCadastroProdutosGridWidget(
                tabController: widget.tabController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
