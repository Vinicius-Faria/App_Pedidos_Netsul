import 'package:pedidos/app/modules/config/config_widget.dart';
import 'package:pedidos/app/modules/menu/menu_controller.dart';
import 'package:pedidos/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pedidos/app/app_widget.dart';

import 'modules/login/login_module.dart';
import 'modules/menu/menu_widget.dart';
import 'modules/sincro/sincronizar.dart';
import 'package:pedidos/app/modules/cliente/client_list.dart';

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
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
