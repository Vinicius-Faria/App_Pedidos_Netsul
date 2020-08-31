import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  TextEditingController loginUsuarioController = TextEditingController();
  TextEditingController loginSenhaController = TextEditingController();
  TextEditingController configIpController = TextEditingController();

  Completer<SharedPreferences> _instancia = Completer<SharedPreferences>();

  _init() async {
    _instancia.complete(await SharedPreferences.getInstance());
  }

  _AppControllerBase() {
    _init();
    _lerArqIni();
  }

  @action
  Future _lerArqIni() async {
    var sp = await _instancia.future;
    updIP(sp.get('ip') ?? '');
    updUsuario(sp.get('user') ?? '');
    updSenha(sp.get('pwd') ?? '');
    updLogin(sp.get('login') ?? '');
    updLembrarUsuario(sp.get('lusu') ?? false);
    updWifi(sp.get('lwifi') ?? false);
    updIdUsuario(sp.get('id') ?? 0);

    updtotCli(sp.get('cli') ?? 0);
    updTotPed(sp.get('ped') ?? 0);
    updTotPro(sp.get('prod') ?? 0);
    updTotCat(sp.get('cat') ?? 0);

    //controllers
    loginUsuarioController.text = usuario;
    loginSenhaController.text = senha;
    configIpController.text = ip;
  }

  @action
  Future gravarArqIni() async {
    var sp = await _instancia.future;

    sp.setString('ip', ip);
    sp.setString('user', usuario);
    sp.setString('pwd', senha);
    sp.setString('login', login);
    sp.setInt('id', idUsuario);
    sp.setBool('lusu', lembrarUsuario);
    sp.setBool('lwifi', lembrarWifi);

    sp.setInt('cli', totCli);
    sp.setInt('ped', totPed);
    sp.setInt('prod', totProd);
    sp.setInt('cat', totCat);

    updIdUsuario(idUsuario);
    updSenha(senha);
    updIP(ip);
  }

  @observable
  bool senhaVisivel = false;

  @action
  void mudaSenha() {
    senhaVisivel = !senhaVisivel;
  }

  @observable
  String ip = '';

  @action
  void updIP(String value) {
    ip = value;
  }

  @observable
  int idUsuario = 0;

  @action
  void updIdUsuario(int value) {
    idUsuario = value;
  }

  @observable
  int totProd = 0;

  @action
  void updTotPro(int value) {
    totProd = value;
  }

  @observable
  int totCli = 0;

  @action
  void updtotCli(int value) {
    totCli = value;
  }

  @observable
  int totPed = 0;

  @action
  void updTotPed(int value) {
    totPed = value;
  }

  @observable
  int totCat = 0;

  @action
  void updTotCat(int value) {
    totCat = value;
  }

  @observable
  String senha = '';

  @action
  void updSenha(String value) {
    senha = value;
  }

  @observable
  String usuario = '';

  @action
  void updUsuario(String value) {
    usuario = value;
  }

  @observable
  String login = '';

  @action
  void updLogin(String value) {
    login = value;
  }

  @observable
  bool lembrarUsuario = false;

  @action
  void updLembrarUsuario(bool value) {
    lembrarUsuario = value;
  }

  @observable
  bool lembrarWifi = false;

  @action
  void updWifi(bool value) {
    lembrarWifi = value;
  }

  @computed
  String get urlbase => 'http://$ip:8082/';

  @computed
  String get loginRemoto =>
      urlbase +
      'Login?dwaccesstag=UVZGREVTT0tIMTAwSFhB&user=' +
      base64.encode(utf8.encode(usuario)) +
      '&pwd=' +
      base64.encode(utf8.encode(senha));

  @computed
  String get produtoRemoto =>
      urlbase +
      'Generico?dwaccesstag=UVZGREVTT0tIMTAwSFhB&pSelect=' +
      base64.encode(utf8.encode(
          'select id, nome, idcategoria, unidade, cast(preco * 100 as integer) preco,' +
              "'R\$ '" +
              '|| cast(preco as numeric(15,2)) valorfmt from produto order by 2'));

  @computed
  String get categoriaRemoto =>
      urlbase +
      'Generico?dwaccesstag=UVZGREVTT0tIMTAwSFhB&pSelect=' +
      base64.encode(utf8.encode('select * from categoria order by 2'));

  @computed
  String get clienteRemoto =>
      urlbase +
      'Generico?dwaccesstag=UVZGREVTT0tIMTAwSFhB&pSelect=' +
      base64.encode(utf8.encode(
          'select id, nome, bairro, cep, endereco, fantasia, ' +
              'lat, lng, municipio, numero, telefone, uf from cliente' +
              ' order by 2'));

  @computed
  String get nomevendedor => 'Vendedor: $login';
}