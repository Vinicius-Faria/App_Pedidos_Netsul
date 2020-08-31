import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dmlocal.dart';
import 'modelos/categorias.dart';
import 'modelos/clientes.dart';
import 'modelos/produtos.dart';

//metodo para ler as categorias do dw
Future<List<CategoriasModel>> buscaCategorias(String url) async {
  //limpar a tabela categoria
  await Basedados.instance.delCategoria();

  final resposta = await http.get(url);

  if (resposta.statusCode == 200) {
    List _categorias = json.decode(utf8.decode(resposta.bodyBytes));
    print(_categorias.toList());
    return _categorias
        .map((_categorias) => CategoriasModel.fromJson(_categorias))
        .toList();
  } else
    throw Exception('Erro ao carregar categorias');
}

//metodo para ler as produtos do dw
Future<List<ProdutosModel>> buscaProdutos(String url) async {
  //limpar a tabela produtos
  await Basedados.instance.delProduto();

  final resposta = await http.get(url);

  if (resposta.statusCode == 200) {
    List _produtos = json.decode(utf8.decode(resposta.bodyBytes));
    print(_produtos.toList());
    return _produtos
        .map((_produtos) => ProdutosModel.fromJson(_produtos))
        .toList();
  } else
    throw Exception('Erro ao carregar produtos');
}

//metodo para ler as clientes do dw
Future<List<ClientesModel>> buscaClientes(String url) async {
  //limpar a tabela produtos
  await Basedados.instance.delCliente();

  final resposta = await http.get(url);

  if (resposta.statusCode == 200) {
    List _clientes = json.decode(utf8.decode(resposta.bodyBytes));
    print(_clientes.toList());
    return _clientes
        .map((_clientes) => ClientesModel.fromJson(_clientes))
        .toList();
  } else
    throw Exception('Erro ao carregar produtos');
}

Future<void> enviaPedido() async {
  List _ped = await Basedados.instance.enviarPedido();
  print(_ped);

  List _itens = await Basedados.instance.enviarItens();
  print(_itens);
}

Future<void> listaCategoria() async {
  Stream<List<Categoria>> _ped = Basedados.instance.enviaCat();
  print(_ped);
}
