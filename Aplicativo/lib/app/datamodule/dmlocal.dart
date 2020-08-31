import 'package:flutter/foundation.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'dmlocal.g.dart';

//todas as categorias do servidor
class Categorias extends Table {
  IntColumn get id => integer().nullable()();
  TextColumn get nome => text().withLength(max: 30)();
}

class Produtos extends Table {
  IntColumn get id => integer()();
  TextColumn get nome => text().withLength(max: 50)();
  IntColumn get idcategoria => integer()();
  TextColumn get unidade => text()();
  IntColumn get preco => integer()();
  TextColumn get valorfmt => text()();
  RealColumn get quant => real()();
  @override
  Set<Column> get primaryKey => {id};
}

class Clientes extends Table {
  IntColumn get id => integer()();
  TextColumn get nome => text().withLength(max: 50)();
  TextColumn get fantasia => text().withLength(max: 50)();
  TextColumn get endereco => text()();
  TextColumn get numero => text()();
  TextColumn get bairro => text()();
  TextColumn get cep => text()();
  TextColumn get telefone => text()();
  TextColumn get uf => text()();
  TextColumn get municipio => text()();
  TextColumn get lat => text()();
  TextColumn get lng => text()();
  @override
  Set<Column> get primaryKey => {id};
}

class Pedidos extends Table {
  TextColumn get id => text()();
  IntColumn get idvendedor => integer()();
  IntColumn get idcliente => integer()();
  TextColumn get nomecliente => text()();
  TextColumn get datapedido => text()();
  IntColumn get total => integer()();
  TextColumn get totalfmt => text()();
  IntColumn get enviado => integer().withDefault(const Constant(0))();
  @override
  Set<Column> get primaryKey => {id};
}

class Itens extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idpedido => text()();
  IntColumn get idproduto => integer()();
  IntColumn get qtde => integer()();
  IntColumn get valor => integer()();
  TextColumn get totalfmt => text()();
  TextColumn get nome => text().withLength(max: 50)();
  IntColumn get enviado => integer().withDefault(const Constant(0))();
  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(
  tables: [
    Categorias,
    Produtos,
    Clientes,
    Pedidos,
    Itens,
  ],
  queries: {
    'contaCategorias': 'SELECT COUNT(*) FROM categorias AS "TOTAL";',
    'contaProdutos': 'SELECT COUNT(*) FROM produtos AS "TOTAL";',
    'contaClientes': 'SELECT COUNT(*) FROM clientes AS "TOTAL";',
    'contaPedidosAll': 'SELECT COUNT(*) FROM pedidos AS "TOTAL";',
    'contaPedidosEnviado':
        'SELECT COUNT(*) FROM pedidos AS "TOTAL" WHERE enviado = 1;',
    'contaPedidosLocal':
        'SELECT COUNT(*) FROM pedidos AS "TOTAL" WHERE enviado = 0;',
  },
)
class Basedados extends _$Basedados {
  //classe estatica para toda a aplicacao
  static final Basedados instance = Basedados._internal();

  //criar um singleton
  Basedados._internal()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  //categoria
  Stream<List<Categoria>> getCategoria() {
    return select(categorias).watch();
  }

  Future addCategoria(Categoria categoria) {
    return into(categorias).insert(categoria);
  }

  Future delCategoria() {
    return (delete(categorias)).go();
  }

  //produtos
  Future addProduto(Produto produto) {
    return into(produtos).insert(produto);
  }

  Future delProduto() {
    return (delete(produtos)).go();
  }

  //filtrar produtos pela categoria
  Stream<List<Produto>> getProdutosCategoria(int id) {
    return (select(produtos)
          ..where((produto) => produto.idcategoria.equals(id)))
        .watch();
  }

  Future delAllPedidos() {
    return (delete(pedidos).go());
  }

  Future delPedidoId(String idPedido) {
    return (delete(pedidos)..where((id) => pedidos.id.equals(idPedido))).go();
  }

  //itens
  Future addItem(Iten item) {
    return into(itens).insert(item);
  }

  Future delAllItem() {
    return (delete(itens)).go();
  }

  Future delItemId(int idItem) {
    return (delete(itens)..where((id) => itens.id.equals(idItem))).go();
  }

//clientes
  Future addCliente(Cliente cliente) {
    return into(clientes).insert(cliente);
  }

  Future delCliente() {
    return (delete(clientes)).go();
  }

  Stream<List<Cliente>> getCliente() {
    return select(clientes).watch();
  }

  Future<List<Pedido>> getPedidoLocal() {
    return (select(pedidos)..where((pedido) => pedido.enviado.equals(0))).get();
  }

  Future<List<Iten>> getItensLocal() {
    return (select(itens)..where((iten) => iten.enviado.equals(0))).get();
  }
  //selects para envio

  Future<List<Iten>> enviarItens() {
    return (select(itens)
          ..addColumns(
              [itens.idpedido, itens.idproduto, itens.qtde, itens.valor])
          ..where((iten) => iten.enviado.equals(0)))
        .get();
  }

  Future<List<Pedido>> enviarPedido() {
    return (select(pedidos)..where((pedido) => pedido.enviado.equals(0))).get();
  }

  Stream<List<Categoria>> enviaCat() {
    return (select(categorias)).watch().map((rows) => rows.map((row) {
          return Categoria(nome: row.nome);
          //ticket: row.readTable( userTicket.map((data)=>) ));
        }).toList());
  }

  //contar rows
  Future<int> countCa() async => (await select(categorias).get()).length;
  Future<int> countPr() async => (await select(produtos).get()).length;
  Future<int> countPe() async => (await select(pedidos).get()).length;
  Future<int> countCl() async => (await select(clientes).get()).length;

  // Future<List<Categoria>> nmeCat() {
  //   return enviaCat().get();
  // }

  //controlar a versão. qualquer alteração é so rodar o comando novamente para recriar
  @override
  int get schemaVersion => 1;
}

// class CategoriaNome {
//   final Categoria categoria;
//   CategoriaNome(this.categoria);
// }
