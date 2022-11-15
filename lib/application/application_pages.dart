import 'package:get/get.dart';
import 'package:pdvandroid_flutter/presentation/caixa/caixa_binding.dart';
import 'package:pdvandroid_flutter/presentation/caixa/caixa_view.dart';
import 'package:pdvandroid_flutter/presentation/caixa/pages/caixa_abertura_view.dart';
import 'package:pdvandroid_flutter/presentation/caixa/pages/caixa_fechamento_view.dart';
import 'package:pdvandroid_flutter/presentation/clientes/clientes_binding.dart';
import 'package:pdvandroid_flutter/presentation/clientes/clientes_view.dart';
import 'package:pdvandroid_flutter/presentation/empresa/empresa_binding.dart';
import 'package:pdvandroid_flutter/presentation/empresa/empresa_view.dart';
import 'package:pdvandroid_flutter/presentation/forma_pagamento/forma_pagamento_binding.dart';
import 'package:pdvandroid_flutter/presentation/forma_pagamento/forma_pagamento_view.dart';
import 'package:pdvandroid_flutter/presentation/launcher/launcher_binding.dart';
import 'package:pdvandroid_flutter/presentation/launcher/launcher_view.dart';
import 'package:pdvandroid_flutter/presentation/login/login_binding.dart';
import 'package:pdvandroid_flutter/presentation/login/login_view.dart';
import 'package:pdvandroid_flutter/presentation/produtos/produtos_binding.dart';
import 'package:pdvandroid_flutter/presentation/produtos/produtos_view.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/vendas_cadastro_bindings.dart';
import 'package:pdvandroid_flutter/presentation/vendas_cadastro/vendas_cadastro_view.dart';
import 'package:pdvandroid_flutter/presentation/vendas_lista/vendas_lista_bindings.dart';
import 'package:pdvandroid_flutter/presentation/vendas_lista/vendas_lista_view.dart';

part 'application_routes.dart';

class ApplicationPages {
  static const initialRoute = ApplicationRoutes.login;

  static final routes = [
    GetPage(
      name: ApplicationRoutes.login,
      page: () => LoginView(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: ApplicationRoutes.launcher,
      page: () => LauncherView(),
      bindings: [
        LauncherBinding(),
      ],
    ),
    GetPage(
      name: ApplicationRoutes.vendasLista,
      page: () => VendasListaView(),
      bindings: [
        VendasListaBinding(),
      ],
    ),
    GetPage(
      name: ApplicationRoutes.vendasCadastro,
      page: () => VendasCadastroView(
        vendaCadastro: Get.arguments,
      ),
      bindings: [
        VendasCadatroBinding(),
      ],
    ),
    GetPage(
      name: ApplicationRoutes.cliente,
      page: () => ClienteView(),
      bindings: [
        ClienteBinding(),
      ],
    ),
    GetPage(
      name: ApplicationRoutes.produto,
      page: () => ProdutosView(),
      bindings: [
        ProdutosBinding(),
      ],
    ),
    GetPage(
      name: ApplicationRoutes.formaPagamento,
      page: () => FormaPagamentoView(),
      bindings: [
        FormaPagamentoBinding(),
      ],
    ),
    GetPage(
      name: ApplicationRoutes.empresas,
      page: () => EmpresaView(),
      bindings: [
        EmpresaBinding(),
      ],
    ),
    GetPage(
      name: ApplicationRoutes.caixa,
      page: () => CaixaView(),
      bindings: [
        CaixaBinding(),
      ],
    ),
    GetPage(
      name: ApplicationRoutes.caixaAbertura,
      page: () => CaixaAberturaView(),
      bindings: [],
    ),
    GetPage(
      name: ApplicationRoutes.caixaFechamento,
      page: () => CaixaFechamentoView(),
      bindings: [],
    ),
  ];
}
