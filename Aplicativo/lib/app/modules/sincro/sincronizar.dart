import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../../../app/datamodule/dm_remoto.dart';
import '../../../app/datamodule/dmlocal.dart';
import '../../../app/modules/shared/botao_customizado.dart';
import '../../../app/modules/shared/icon_header.dart';
import '../../../app/modules/shared/item_listtile.dart';

import '../../app_controller.dart';

ProgressDialog pr;

class SincroPage extends StatefulWidget {
  @override
  _SincroPageState createState() => _SincroPageState();
}

class _SincroPageState extends ModularState<SincroPage, AppController> {
  bool categ = false;
  bool cliente = false;
  bool pedido = false;
  bool produto = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          IconeHeader(
            icone: FontAwesomeIcons.database,
            titulo: 'Sincronização',
            cor1: Color(0xff317183),
            cor2: Color(0xff46997D),
          ),
          Observer(builder: (_) {
            return ItemList(
              cor: Color(0xff317183),
              titulo: 'Categorias',
              subtitulo: 'Quantidade: ${controller.totCat}',
              item: Switch(
                  activeColor: Color(0xff317183),
                  value: categ,
                  onChanged: (bool vlr) {
                    setState(() {
                      categ = vlr;
                    });
                  }),
              icone: FontAwesomeIcons.boxOpen,
            );
          }),
          Observer(builder: (_) {
            return ItemList(
              cor: Color(0xff46997D),
              titulo: 'Clientes',
              subtitulo: 'Quantidade: ${controller.totCli}',
              item: Switch(
                  activeColor: Color(0xff46997D),
                  value: cliente,
                  onChanged: (bool vlr) {
                    setState(() {
                      cliente = vlr;
                    });
                  }),
              icone: FontAwesomeIcons.userAlt,
            );
          }),
          Observer(builder: (_) {
            return ItemList(
              cor: Color(0xff317183),
              titulo: 'Pedidos',
              subtitulo: 'Quantidade: ${controller.totPed}',
              item: Switch(
                  activeColor: Color(0xff317183),
                  value: pedido,
                  onChanged: (bool vlr) {
                    setState(() {
                      pedido = vlr;
                    });
                  }),
              icone: Icons.settings,
            );
          }),
          Observer(builder: (_) {
            return ItemList(
              cor: Color(0xff46997D),
              titulo: 'Produtos',
              subtitulo: 'Qtde: ${controller.totProd}',
              item: Switch(
                  activeColor: Color(0xff46997D),
                  value: produto,
                  onChanged: (bool vlr) {
                    setState(() {
                      produto = vlr;
                    });
                  }),
              icone: Icons.settings,
            );
          }),
          Expanded(child: Container()),
          BotaoInfo(
            icone: Icons.settings,
            cor1: Color(0xff317183),
            cor2: Color(0xff46997D),
            texto: 'Sincronizar',
            onPress: () async {
              if (categ == true ||
                  cliente == true ||
                  pedido == true ||
                  produto == true) {
                pr = ProgressDialog(context);
                pr.update(message: 'Aguarde...');
                pr.show();

                if (pedido) {
                  pr.update(message: 'Enviando pedidos...');
                  await enviaPedido(controller.enviaVendas);
                }
                if (categ) {
                  pr.update(message: 'Atualizando Categorias...');
                  await buscaCategorias(controller.categoriaRemoto);
                  int ca = await Basedados.instance.countCa();
                  controller.updTotCat(ca);
                  print(controller.totCat);
                }

                if (cliente) {
                  pr.update(message: 'Atualizando Clientes...');
                  await enviarClientes(controller.enviaClientes);
                  // await buscaClientes(controller.clienteRemoto);
                  // int c = await Basedados.instance.countCl();
                  // controller.updtotCli(c);
                }

                if (produto) {
                  pr.update(message: 'Atualizando Produtos...');
                  await buscaProdutos(controller.produtoRemoto);
                  int c = await Basedados.instance.countPr();
                  controller.updTotPro(c);
                }
                await controller.gravarArqIni();
                pr.hide();
              }
              //volta ao menu
              Modular.to.pop();
            },
          ),
        ],
      ),
    );
  }
}
