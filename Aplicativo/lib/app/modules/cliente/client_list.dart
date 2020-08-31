import 'package:call_number/call_number.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../app/datamodule/dmlocal.dart';
import '../../../app/modules/shared/icon_header.dart';

import '../../app_controller.dart';

class ClienteList extends StatefulWidget {
  @override
  _ClienteListState createState() => _ClienteListState();
}

class _ClienteListState extends ModularState<ClienteList, AppController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                IconeHeader(
                  icone: Icons.supervisor_account,
                  titulo: 'Clientes registrados',
                  cor1: Color(0xff317183),
                  cor2: Color(0xff46997D),
                  altura: 200,
                ),
                Positioned(
                  top: 15,
                  left: 15,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 40,
                    onPressed: () {
                      Modular.to.pop();
                    },
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: Observer(
                    builder: (_) {
                      return Text(
                        controller.totCli.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<List<Cliente>>(
                  stream: Basedados.instance.getCliente(),
                  initialData: [],
                  builder: (context, snapshot) {
                    List<Cliente> cli = snapshot.data;
                    if (!snapshot.hasData || snapshot.data.length == 0) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: cli.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: ExpansionTileCard(
                                title: Text(
                                  cli[index].nome,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xff317183),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  cli[index].municipio + ' - ' + cli[index].uf,
                                  style: TextStyle(
                                    color: Color(0xff46997D),
                                  ),
                                ),
                                children: [
                                  Divider(
                                    thickness: 1,
                                    height: 1,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: RichText(
                                        text: TextSpan(
                                            text:
                                                '${cli[index].endereco}, ${cli[index].numero}\n',
                                            style: TextStyle(
                                                color: Color(0xff317183),
                                                fontWeight: FontWeight.w600),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    '${cli[index].cep} - ${cli[index].bairro}\n',
                                                style: TextStyle(
                                                    color: Color(0xff317183),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              TextSpan(
                                                text: '${cli[index].telefone}',
                                                style: TextStyle(
                                                    color: Color(0xff317183),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.spaceAround,
                                    buttonHeight: 52,
                                    buttonMinWidth: 90,
                                    children: [
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Column(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.phone,
                                              color: cli[index].telefone == ''
                                                  ? Colors.grey
                                                  : Color(0xff46997D),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 2,
                                              ),
                                            ),
                                            Text(
                                              'Ligar',
                                              style: TextStyle(
                                                color: cli[index].telefone == ''
                                                    ? Colors.grey
                                                    : Color(0xff46997D),
                                              ),
                                            )
                                          ],
                                        ),
                                        onPressed: () {
                                          if (cli[index].telefone != '') {
                                            //ligar para o numero
                                            String fone = cli[index]
                                                .telefone
                                                .replaceAll('(', '');
                                            fone = fone.replaceAll(')', '');
                                            fone = fone.replaceAll(' ', '');
                                            fone = fone.replaceAll('-', '');
                                            fone = fone.trim();
                                            if (fone.substring(0, 1) != '0') {
                                              fone = '0' + fone;
                                            }
                                            //print(fone);
                                            CallNumber().callNumber(fone);
                                          }
                                        },
                                      ),
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.room,
                                              color: cli[index].lat == '' ||
                                                      cli[index].lng == ''
                                                  ? Colors.grey
                                                  : Color(0xff46997D),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 2,
                                              ),
                                            ),
                                            Text(
                                              'Mapa',
                                              style: TextStyle(
                                                color: cli[index].lat == '' ||
                                                        cli[index].lng == ''
                                                    ? Colors.grey
                                                    : Color(0xff46997D),
                                              ),
                                            )
                                          ],
                                        ),
                                        onPressed: () {},
                                      ),
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.edit,
                                              color: Color(0xff46997D),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 2,
                                              ),
                                            ),
                                            Text(
                                              'Editar',
                                              style: TextStyle(
                                                color: Color(0xff46997D),
                                              ),
                                            )
                                          ],
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
