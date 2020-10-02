import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'package:pedidos/app/modules/config/config_widget.dart';
import 'package:pedidos/app/modules/menu/menu_controller.dart';
import 'package:pedidos/app/app_controller.dart';
import 'package:pedidos/app/app_widget.dart';
import 'package:pedidos/app/modules/cliente/client_ficha.dart';
import 'package:pedidos/app/modules/cliente/cliet_sel.dart';
import 'package:pedidos/app/modules/pedido/ped_prod.dart';
import 'package:pedidos/app/modules/produto/prod_list.dart';
import 'package:pedidos/app/modules/cliente/client_list.dart';

import 'modules/login/login_module.dart';
import 'modules/menu/menu_widget.dart';
import 'modules/pedido/ped_list.dart';
import 'modules/sincro/sincronizar.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MenuController()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LoginModule()),
        Router('/menu', child: (_, args) => MenuWidget()),
        Router('/config', child: (_, args) => ConfigPage()),
        Router('/sincro', child: (_, args) => SincroPage()),
        Router('/clientelista', child: (_, args) => ClienteList()),
        Router('/clienteFicha', child: (_, args) => ClienteFicha()),
        Router('/produtoLista', child: (_, args) => ProdList()),
        Router('/pedidoLista', child: (_, args) => PedidoList()),
        Router('/clienteSel', child: (_, args) => ClienteSel()),
        Router('/pedidoProduto', child: (_, args) => PedProduto()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
