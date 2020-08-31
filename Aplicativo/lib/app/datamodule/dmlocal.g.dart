// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dmlocal.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Categoria extends DataClass implements Insertable<Categoria> {
  final int id;
  final String nome;
  Categoria({this.id, @required this.nome});
  factory Categoria.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Categoria(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      nome: stringType.mapFromDatabaseResponse(data['${effectivePrefix}nome']),
    );
  }
  factory Categoria.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Categoria(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
    };
  }

  @override
  CategoriasCompanion createCompanion(bool nullToAbsent) {
    return CategoriasCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      nome: nome == null && nullToAbsent ? const Value.absent() : Value(nome),
    );
  }

  Categoria copyWith({int id, String nome}) => Categoria(
        id: id ?? this.id,
        nome: nome ?? this.nome,
      );
  @override
  String toString() {
    return (StringBuffer('Categoria(')
          ..write('id: $id, ')
          ..write('nome: $nome')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, nome.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Categoria && other.id == this.id && other.nome == this.nome);
}

class CategoriasCompanion extends UpdateCompanion<Categoria> {
  final Value<int> id;
  final Value<String> nome;
  const CategoriasCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
  });
  CategoriasCompanion.insert({
    this.id = const Value.absent(),
    @required String nome,
  }) : nome = Value(nome);
  CategoriasCompanion copyWith({Value<int> id, Value<String> nome}) {
    return CategoriasCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
    );
  }
}

class $CategoriasTable extends Categorias
    with TableInfo<$CategoriasTable, Categoria> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoriasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  GeneratedTextColumn _nome;
  @override
  GeneratedTextColumn get nome => _nome ??= _constructNome();
  GeneratedTextColumn _constructNome() {
    return GeneratedTextColumn('nome', $tableName, false, maxTextLength: 30);
  }

  @override
  List<GeneratedColumn> get $columns => [id, nome];
  @override
  $CategoriasTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'categorias';
  @override
  final String actualTableName = 'categorias';
  @override
  VerificationContext validateIntegrity(CategoriasCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.nome.present) {
      context.handle(
          _nomeMeta, nome.isAcceptableValue(d.nome.value, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Categoria map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Categoria.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CategoriasCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.nome.present) {
      map['nome'] = Variable<String, StringType>(d.nome.value);
    }
    return map;
  }

  @override
  $CategoriasTable createAlias(String alias) {
    return $CategoriasTable(_db, alias);
  }
}

class Produto extends DataClass implements Insertable<Produto> {
  final int id;
  final String nome;
  final int idcategoria;
  final String unidade;
  final int preco;
  final String valorfmt;
  final double quant;
  Produto(
      {@required this.id,
      @required this.nome,
      @required this.idcategoria,
      @required this.unidade,
      @required this.preco,
      @required this.valorfmt,
      @required this.quant});
  factory Produto.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Produto(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      nome: stringType.mapFromDatabaseResponse(data['${effectivePrefix}nome']),
      idcategoria: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}idcategoria']),
      unidade:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}unidade']),
      preco: intType.mapFromDatabaseResponse(data['${effectivePrefix}preco']),
      valorfmt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}valorfmt']),
      quant:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}quant']),
    );
  }
  factory Produto.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Produto(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      idcategoria: serializer.fromJson<int>(json['idcategoria']),
      unidade: serializer.fromJson<String>(json['unidade']),
      preco: serializer.fromJson<int>(json['preco']),
      valorfmt: serializer.fromJson<String>(json['valorfmt']),
      quant: serializer.fromJson<double>(json['quant']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'idcategoria': serializer.toJson<int>(idcategoria),
      'unidade': serializer.toJson<String>(unidade),
      'preco': serializer.toJson<int>(preco),
      'valorfmt': serializer.toJson<String>(valorfmt),
      'quant': serializer.toJson<double>(quant),
    };
  }

  @override
  ProdutosCompanion createCompanion(bool nullToAbsent) {
    return ProdutosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      nome: nome == null && nullToAbsent ? const Value.absent() : Value(nome),
      idcategoria: idcategoria == null && nullToAbsent
          ? const Value.absent()
          : Value(idcategoria),
      unidade: unidade == null && nullToAbsent
          ? const Value.absent()
          : Value(unidade),
      preco:
          preco == null && nullToAbsent ? const Value.absent() : Value(preco),
      valorfmt: valorfmt == null && nullToAbsent
          ? const Value.absent()
          : Value(valorfmt),
      quant:
          quant == null && nullToAbsent ? const Value.absent() : Value(quant),
    );
  }

  Produto copyWith(
          {int id,
          String nome,
          int idcategoria,
          String unidade,
          int preco,
          String valorfmt,
          double quant}) =>
      Produto(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        idcategoria: idcategoria ?? this.idcategoria,
        unidade: unidade ?? this.unidade,
        preco: preco ?? this.preco,
        valorfmt: valorfmt ?? this.valorfmt,
        quant: quant ?? this.quant,
      );
  @override
  String toString() {
    return (StringBuffer('Produto(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('idcategoria: $idcategoria, ')
          ..write('unidade: $unidade, ')
          ..write('preco: $preco, ')
          ..write('valorfmt: $valorfmt, ')
          ..write('quant: $quant')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          nome.hashCode,
          $mrjc(
              idcategoria.hashCode,
              $mrjc(
                  unidade.hashCode,
                  $mrjc(preco.hashCode,
                      $mrjc(valorfmt.hashCode, quant.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Produto &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.idcategoria == this.idcategoria &&
          other.unidade == this.unidade &&
          other.preco == this.preco &&
          other.valorfmt == this.valorfmt &&
          other.quant == this.quant);
}

class ProdutosCompanion extends UpdateCompanion<Produto> {
  final Value<int> id;
  final Value<String> nome;
  final Value<int> idcategoria;
  final Value<String> unidade;
  final Value<int> preco;
  final Value<String> valorfmt;
  final Value<double> quant;
  const ProdutosCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.idcategoria = const Value.absent(),
    this.unidade = const Value.absent(),
    this.preco = const Value.absent(),
    this.valorfmt = const Value.absent(),
    this.quant = const Value.absent(),
  });
  ProdutosCompanion.insert({
    @required int id,
    @required String nome,
    @required int idcategoria,
    @required String unidade,
    @required int preco,
    @required String valorfmt,
    @required double quant,
  })  : id = Value(id),
        nome = Value(nome),
        idcategoria = Value(idcategoria),
        unidade = Value(unidade),
        preco = Value(preco),
        valorfmt = Value(valorfmt),
        quant = Value(quant);
  ProdutosCompanion copyWith(
      {Value<int> id,
      Value<String> nome,
      Value<int> idcategoria,
      Value<String> unidade,
      Value<int> preco,
      Value<String> valorfmt,
      Value<double> quant}) {
    return ProdutosCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      idcategoria: idcategoria ?? this.idcategoria,
      unidade: unidade ?? this.unidade,
      preco: preco ?? this.preco,
      valorfmt: valorfmt ?? this.valorfmt,
      quant: quant ?? this.quant,
    );
  }
}

class $ProdutosTable extends Produtos with TableInfo<$ProdutosTable, Produto> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProdutosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  GeneratedTextColumn _nome;
  @override
  GeneratedTextColumn get nome => _nome ??= _constructNome();
  GeneratedTextColumn _constructNome() {
    return GeneratedTextColumn('nome', $tableName, false, maxTextLength: 50);
  }

  final VerificationMeta _idcategoriaMeta =
      const VerificationMeta('idcategoria');
  GeneratedIntColumn _idcategoria;
  @override
  GeneratedIntColumn get idcategoria =>
      _idcategoria ??= _constructIdcategoria();
  GeneratedIntColumn _constructIdcategoria() {
    return GeneratedIntColumn(
      'idcategoria',
      $tableName,
      false,
    );
  }

  final VerificationMeta _unidadeMeta = const VerificationMeta('unidade');
  GeneratedTextColumn _unidade;
  @override
  GeneratedTextColumn get unidade => _unidade ??= _constructUnidade();
  GeneratedTextColumn _constructUnidade() {
    return GeneratedTextColumn(
      'unidade',
      $tableName,
      false,
    );
  }

  final VerificationMeta _precoMeta = const VerificationMeta('preco');
  GeneratedIntColumn _preco;
  @override
  GeneratedIntColumn get preco => _preco ??= _constructPreco();
  GeneratedIntColumn _constructPreco() {
    return GeneratedIntColumn(
      'preco',
      $tableName,
      false,
    );
  }

  final VerificationMeta _valorfmtMeta = const VerificationMeta('valorfmt');
  GeneratedTextColumn _valorfmt;
  @override
  GeneratedTextColumn get valorfmt => _valorfmt ??= _constructValorfmt();
  GeneratedTextColumn _constructValorfmt() {
    return GeneratedTextColumn(
      'valorfmt',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quantMeta = const VerificationMeta('quant');
  GeneratedRealColumn _quant;
  @override
  GeneratedRealColumn get quant => _quant ??= _constructQuant();
  GeneratedRealColumn _constructQuant() {
    return GeneratedRealColumn(
      'quant',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, nome, idcategoria, unidade, preco, valorfmt, quant];
  @override
  $ProdutosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'produtos';
  @override
  final String actualTableName = 'produtos';
  @override
  VerificationContext validateIntegrity(ProdutosCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.nome.present) {
      context.handle(
          _nomeMeta, nome.isAcceptableValue(d.nome.value, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (d.idcategoria.present) {
      context.handle(_idcategoriaMeta,
          idcategoria.isAcceptableValue(d.idcategoria.value, _idcategoriaMeta));
    } else if (isInserting) {
      context.missing(_idcategoriaMeta);
    }
    if (d.unidade.present) {
      context.handle(_unidadeMeta,
          unidade.isAcceptableValue(d.unidade.value, _unidadeMeta));
    } else if (isInserting) {
      context.missing(_unidadeMeta);
    }
    if (d.preco.present) {
      context.handle(
          _precoMeta, preco.isAcceptableValue(d.preco.value, _precoMeta));
    } else if (isInserting) {
      context.missing(_precoMeta);
    }
    if (d.valorfmt.present) {
      context.handle(_valorfmtMeta,
          valorfmt.isAcceptableValue(d.valorfmt.value, _valorfmtMeta));
    } else if (isInserting) {
      context.missing(_valorfmtMeta);
    }
    if (d.quant.present) {
      context.handle(
          _quantMeta, quant.isAcceptableValue(d.quant.value, _quantMeta));
    } else if (isInserting) {
      context.missing(_quantMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Produto map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Produto.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ProdutosCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.nome.present) {
      map['nome'] = Variable<String, StringType>(d.nome.value);
    }
    if (d.idcategoria.present) {
      map['idcategoria'] = Variable<int, IntType>(d.idcategoria.value);
    }
    if (d.unidade.present) {
      map['unidade'] = Variable<String, StringType>(d.unidade.value);
    }
    if (d.preco.present) {
      map['preco'] = Variable<int, IntType>(d.preco.value);
    }
    if (d.valorfmt.present) {
      map['valorfmt'] = Variable<String, StringType>(d.valorfmt.value);
    }
    if (d.quant.present) {
      map['quant'] = Variable<double, RealType>(d.quant.value);
    }
    return map;
  }

  @override
  $ProdutosTable createAlias(String alias) {
    return $ProdutosTable(_db, alias);
  }
}

class Cliente extends DataClass implements Insertable<Cliente> {
  final int id;
  final String nome;
  final String fantasia;
  final String endereco;
  final String numero;
  final String bairro;
  final String cep;
  final String telefone;
  final String uf;
  final String municipio;
  final String lat;
  final String lng;
  Cliente(
      {@required this.id,
      @required this.nome,
      @required this.fantasia,
      @required this.endereco,
      @required this.numero,
      @required this.bairro,
      @required this.cep,
      @required this.telefone,
      @required this.uf,
      @required this.municipio,
      @required this.lat,
      @required this.lng});
  factory Cliente.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Cliente(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      nome: stringType.mapFromDatabaseResponse(data['${effectivePrefix}nome']),
      fantasia: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}fantasia']),
      endereco: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}endereco']),
      numero:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}numero']),
      bairro:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}bairro']),
      cep: stringType.mapFromDatabaseResponse(data['${effectivePrefix}cep']),
      telefone: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}telefone']),
      uf: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uf']),
      municipio: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}municipio']),
      lat: stringType.mapFromDatabaseResponse(data['${effectivePrefix}lat']),
      lng: stringType.mapFromDatabaseResponse(data['${effectivePrefix}lng']),
    );
  }
  factory Cliente.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Cliente(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      fantasia: serializer.fromJson<String>(json['fantasia']),
      endereco: serializer.fromJson<String>(json['endereco']),
      numero: serializer.fromJson<String>(json['numero']),
      bairro: serializer.fromJson<String>(json['bairro']),
      cep: serializer.fromJson<String>(json['cep']),
      telefone: serializer.fromJson<String>(json['telefone']),
      uf: serializer.fromJson<String>(json['uf']),
      municipio: serializer.fromJson<String>(json['municipio']),
      lat: serializer.fromJson<String>(json['lat']),
      lng: serializer.fromJson<String>(json['lng']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'fantasia': serializer.toJson<String>(fantasia),
      'endereco': serializer.toJson<String>(endereco),
      'numero': serializer.toJson<String>(numero),
      'bairro': serializer.toJson<String>(bairro),
      'cep': serializer.toJson<String>(cep),
      'telefone': serializer.toJson<String>(telefone),
      'uf': serializer.toJson<String>(uf),
      'municipio': serializer.toJson<String>(municipio),
      'lat': serializer.toJson<String>(lat),
      'lng': serializer.toJson<String>(lng),
    };
  }

  @override
  ClientesCompanion createCompanion(bool nullToAbsent) {
    return ClientesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      nome: nome == null && nullToAbsent ? const Value.absent() : Value(nome),
      fantasia: fantasia == null && nullToAbsent
          ? const Value.absent()
          : Value(fantasia),
      endereco: endereco == null && nullToAbsent
          ? const Value.absent()
          : Value(endereco),
      numero:
          numero == null && nullToAbsent ? const Value.absent() : Value(numero),
      bairro:
          bairro == null && nullToAbsent ? const Value.absent() : Value(bairro),
      cep: cep == null && nullToAbsent ? const Value.absent() : Value(cep),
      telefone: telefone == null && nullToAbsent
          ? const Value.absent()
          : Value(telefone),
      uf: uf == null && nullToAbsent ? const Value.absent() : Value(uf),
      municipio: municipio == null && nullToAbsent
          ? const Value.absent()
          : Value(municipio),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lng: lng == null && nullToAbsent ? const Value.absent() : Value(lng),
    );
  }

  Cliente copyWith(
          {int id,
          String nome,
          String fantasia,
          String endereco,
          String numero,
          String bairro,
          String cep,
          String telefone,
          String uf,
          String municipio,
          String lat,
          String lng}) =>
      Cliente(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        fantasia: fantasia ?? this.fantasia,
        endereco: endereco ?? this.endereco,
        numero: numero ?? this.numero,
        bairro: bairro ?? this.bairro,
        cep: cep ?? this.cep,
        telefone: telefone ?? this.telefone,
        uf: uf ?? this.uf,
        municipio: municipio ?? this.municipio,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );
  @override
  String toString() {
    return (StringBuffer('Cliente(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('fantasia: $fantasia, ')
          ..write('endereco: $endereco, ')
          ..write('numero: $numero, ')
          ..write('bairro: $bairro, ')
          ..write('cep: $cep, ')
          ..write('telefone: $telefone, ')
          ..write('uf: $uf, ')
          ..write('municipio: $municipio, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          nome.hashCode,
          $mrjc(
              fantasia.hashCode,
              $mrjc(
                  endereco.hashCode,
                  $mrjc(
                      numero.hashCode,
                      $mrjc(
                          bairro.hashCode,
                          $mrjc(
                              cep.hashCode,
                              $mrjc(
                                  telefone.hashCode,
                                  $mrjc(
                                      uf.hashCode,
                                      $mrjc(
                                          municipio.hashCode,
                                          $mrjc(lat.hashCode,
                                              lng.hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Cliente &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.fantasia == this.fantasia &&
          other.endereco == this.endereco &&
          other.numero == this.numero &&
          other.bairro == this.bairro &&
          other.cep == this.cep &&
          other.telefone == this.telefone &&
          other.uf == this.uf &&
          other.municipio == this.municipio &&
          other.lat == this.lat &&
          other.lng == this.lng);
}

class ClientesCompanion extends UpdateCompanion<Cliente> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String> fantasia;
  final Value<String> endereco;
  final Value<String> numero;
  final Value<String> bairro;
  final Value<String> cep;
  final Value<String> telefone;
  final Value<String> uf;
  final Value<String> municipio;
  final Value<String> lat;
  final Value<String> lng;
  const ClientesCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.fantasia = const Value.absent(),
    this.endereco = const Value.absent(),
    this.numero = const Value.absent(),
    this.bairro = const Value.absent(),
    this.cep = const Value.absent(),
    this.telefone = const Value.absent(),
    this.uf = const Value.absent(),
    this.municipio = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
  });
  ClientesCompanion.insert({
    @required int id,
    @required String nome,
    @required String fantasia,
    @required String endereco,
    @required String numero,
    @required String bairro,
    @required String cep,
    @required String telefone,
    @required String uf,
    @required String municipio,
    @required String lat,
    @required String lng,
  })  : id = Value(id),
        nome = Value(nome),
        fantasia = Value(fantasia),
        endereco = Value(endereco),
        numero = Value(numero),
        bairro = Value(bairro),
        cep = Value(cep),
        telefone = Value(telefone),
        uf = Value(uf),
        municipio = Value(municipio),
        lat = Value(lat),
        lng = Value(lng);
  ClientesCompanion copyWith(
      {Value<int> id,
      Value<String> nome,
      Value<String> fantasia,
      Value<String> endereco,
      Value<String> numero,
      Value<String> bairro,
      Value<String> cep,
      Value<String> telefone,
      Value<String> uf,
      Value<String> municipio,
      Value<String> lat,
      Value<String> lng}) {
    return ClientesCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      fantasia: fantasia ?? this.fantasia,
      endereco: endereco ?? this.endereco,
      numero: numero ?? this.numero,
      bairro: bairro ?? this.bairro,
      cep: cep ?? this.cep,
      telefone: telefone ?? this.telefone,
      uf: uf ?? this.uf,
      municipio: municipio ?? this.municipio,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }
}

class $ClientesTable extends Clientes with TableInfo<$ClientesTable, Cliente> {
  final GeneratedDatabase _db;
  final String _alias;
  $ClientesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  GeneratedTextColumn _nome;
  @override
  GeneratedTextColumn get nome => _nome ??= _constructNome();
  GeneratedTextColumn _constructNome() {
    return GeneratedTextColumn('nome', $tableName, false, maxTextLength: 50);
  }

  final VerificationMeta _fantasiaMeta = const VerificationMeta('fantasia');
  GeneratedTextColumn _fantasia;
  @override
  GeneratedTextColumn get fantasia => _fantasia ??= _constructFantasia();
  GeneratedTextColumn _constructFantasia() {
    return GeneratedTextColumn('fantasia', $tableName, false,
        maxTextLength: 50);
  }

  final VerificationMeta _enderecoMeta = const VerificationMeta('endereco');
  GeneratedTextColumn _endereco;
  @override
  GeneratedTextColumn get endereco => _endereco ??= _constructEndereco();
  GeneratedTextColumn _constructEndereco() {
    return GeneratedTextColumn(
      'endereco',
      $tableName,
      false,
    );
  }

  final VerificationMeta _numeroMeta = const VerificationMeta('numero');
  GeneratedTextColumn _numero;
  @override
  GeneratedTextColumn get numero => _numero ??= _constructNumero();
  GeneratedTextColumn _constructNumero() {
    return GeneratedTextColumn(
      'numero',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bairroMeta = const VerificationMeta('bairro');
  GeneratedTextColumn _bairro;
  @override
  GeneratedTextColumn get bairro => _bairro ??= _constructBairro();
  GeneratedTextColumn _constructBairro() {
    return GeneratedTextColumn(
      'bairro',
      $tableName,
      false,
    );
  }

  final VerificationMeta _cepMeta = const VerificationMeta('cep');
  GeneratedTextColumn _cep;
  @override
  GeneratedTextColumn get cep => _cep ??= _constructCep();
  GeneratedTextColumn _constructCep() {
    return GeneratedTextColumn(
      'cep',
      $tableName,
      false,
    );
  }

  final VerificationMeta _telefoneMeta = const VerificationMeta('telefone');
  GeneratedTextColumn _telefone;
  @override
  GeneratedTextColumn get telefone => _telefone ??= _constructTelefone();
  GeneratedTextColumn _constructTelefone() {
    return GeneratedTextColumn(
      'telefone',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ufMeta = const VerificationMeta('uf');
  GeneratedTextColumn _uf;
  @override
  GeneratedTextColumn get uf => _uf ??= _constructUf();
  GeneratedTextColumn _constructUf() {
    return GeneratedTextColumn(
      'uf',
      $tableName,
      false,
    );
  }

  final VerificationMeta _municipioMeta = const VerificationMeta('municipio');
  GeneratedTextColumn _municipio;
  @override
  GeneratedTextColumn get municipio => _municipio ??= _constructMunicipio();
  GeneratedTextColumn _constructMunicipio() {
    return GeneratedTextColumn(
      'municipio',
      $tableName,
      false,
    );
  }

  final VerificationMeta _latMeta = const VerificationMeta('lat');
  GeneratedTextColumn _lat;
  @override
  GeneratedTextColumn get lat => _lat ??= _constructLat();
  GeneratedTextColumn _constructLat() {
    return GeneratedTextColumn(
      'lat',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lngMeta = const VerificationMeta('lng');
  GeneratedTextColumn _lng;
  @override
  GeneratedTextColumn get lng => _lng ??= _constructLng();
  GeneratedTextColumn _constructLng() {
    return GeneratedTextColumn(
      'lng',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        nome,
        fantasia,
        endereco,
        numero,
        bairro,
        cep,
        telefone,
        uf,
        municipio,
        lat,
        lng
      ];
  @override
  $ClientesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'clientes';
  @override
  final String actualTableName = 'clientes';
  @override
  VerificationContext validateIntegrity(ClientesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.nome.present) {
      context.handle(
          _nomeMeta, nome.isAcceptableValue(d.nome.value, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (d.fantasia.present) {
      context.handle(_fantasiaMeta,
          fantasia.isAcceptableValue(d.fantasia.value, _fantasiaMeta));
    } else if (isInserting) {
      context.missing(_fantasiaMeta);
    }
    if (d.endereco.present) {
      context.handle(_enderecoMeta,
          endereco.isAcceptableValue(d.endereco.value, _enderecoMeta));
    } else if (isInserting) {
      context.missing(_enderecoMeta);
    }
    if (d.numero.present) {
      context.handle(
          _numeroMeta, numero.isAcceptableValue(d.numero.value, _numeroMeta));
    } else if (isInserting) {
      context.missing(_numeroMeta);
    }
    if (d.bairro.present) {
      context.handle(
          _bairroMeta, bairro.isAcceptableValue(d.bairro.value, _bairroMeta));
    } else if (isInserting) {
      context.missing(_bairroMeta);
    }
    if (d.cep.present) {
      context.handle(_cepMeta, cep.isAcceptableValue(d.cep.value, _cepMeta));
    } else if (isInserting) {
      context.missing(_cepMeta);
    }
    if (d.telefone.present) {
      context.handle(_telefoneMeta,
          telefone.isAcceptableValue(d.telefone.value, _telefoneMeta));
    } else if (isInserting) {
      context.missing(_telefoneMeta);
    }
    if (d.uf.present) {
      context.handle(_ufMeta, uf.isAcceptableValue(d.uf.value, _ufMeta));
    } else if (isInserting) {
      context.missing(_ufMeta);
    }
    if (d.municipio.present) {
      context.handle(_municipioMeta,
          municipio.isAcceptableValue(d.municipio.value, _municipioMeta));
    } else if (isInserting) {
      context.missing(_municipioMeta);
    }
    if (d.lat.present) {
      context.handle(_latMeta, lat.isAcceptableValue(d.lat.value, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (d.lng.present) {
      context.handle(_lngMeta, lng.isAcceptableValue(d.lng.value, _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cliente map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Cliente.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ClientesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.nome.present) {
      map['nome'] = Variable<String, StringType>(d.nome.value);
    }
    if (d.fantasia.present) {
      map['fantasia'] = Variable<String, StringType>(d.fantasia.value);
    }
    if (d.endereco.present) {
      map['endereco'] = Variable<String, StringType>(d.endereco.value);
    }
    if (d.numero.present) {
      map['numero'] = Variable<String, StringType>(d.numero.value);
    }
    if (d.bairro.present) {
      map['bairro'] = Variable<String, StringType>(d.bairro.value);
    }
    if (d.cep.present) {
      map['cep'] = Variable<String, StringType>(d.cep.value);
    }
    if (d.telefone.present) {
      map['telefone'] = Variable<String, StringType>(d.telefone.value);
    }
    if (d.uf.present) {
      map['uf'] = Variable<String, StringType>(d.uf.value);
    }
    if (d.municipio.present) {
      map['municipio'] = Variable<String, StringType>(d.municipio.value);
    }
    if (d.lat.present) {
      map['lat'] = Variable<String, StringType>(d.lat.value);
    }
    if (d.lng.present) {
      map['lng'] = Variable<String, StringType>(d.lng.value);
    }
    return map;
  }

  @override
  $ClientesTable createAlias(String alias) {
    return $ClientesTable(_db, alias);
  }
}

class Pedido extends DataClass implements Insertable<Pedido> {
  final String id;
  final int idvendedor;
  final int idcliente;
  final String nomecliente;
  final String datapedido;
  final int total;
  final String totalfmt;
  final int enviado;
  Pedido(
      {@required this.id,
      @required this.idvendedor,
      @required this.idcliente,
      @required this.nomecliente,
      @required this.datapedido,
      @required this.total,
      @required this.totalfmt,
      @required this.enviado});
  factory Pedido.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Pedido(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idvendedor:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}idvendedor']),
      idcliente:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}idcliente']),
      nomecliente: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}nomecliente']),
      datapedido: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}datapedido']),
      total: intType.mapFromDatabaseResponse(data['${effectivePrefix}total']),
      totalfmt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}totalfmt']),
      enviado:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}enviado']),
    );
  }
  factory Pedido.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Pedido(
      id: serializer.fromJson<String>(json['id']),
      idvendedor: serializer.fromJson<int>(json['idvendedor']),
      idcliente: serializer.fromJson<int>(json['idcliente']),
      nomecliente: serializer.fromJson<String>(json['nomecliente']),
      datapedido: serializer.fromJson<String>(json['datapedido']),
      total: serializer.fromJson<int>(json['total']),
      totalfmt: serializer.fromJson<String>(json['totalfmt']),
      enviado: serializer.fromJson<int>(json['enviado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'idvendedor': serializer.toJson<int>(idvendedor),
      'idcliente': serializer.toJson<int>(idcliente),
      'nomecliente': serializer.toJson<String>(nomecliente),
      'datapedido': serializer.toJson<String>(datapedido),
      'total': serializer.toJson<int>(total),
      'totalfmt': serializer.toJson<String>(totalfmt),
      'enviado': serializer.toJson<int>(enviado),
    };
  }

  @override
  PedidosCompanion createCompanion(bool nullToAbsent) {
    return PedidosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idvendedor: idvendedor == null && nullToAbsent
          ? const Value.absent()
          : Value(idvendedor),
      idcliente: idcliente == null && nullToAbsent
          ? const Value.absent()
          : Value(idcliente),
      nomecliente: nomecliente == null && nullToAbsent
          ? const Value.absent()
          : Value(nomecliente),
      datapedido: datapedido == null && nullToAbsent
          ? const Value.absent()
          : Value(datapedido),
      total:
          total == null && nullToAbsent ? const Value.absent() : Value(total),
      totalfmt: totalfmt == null && nullToAbsent
          ? const Value.absent()
          : Value(totalfmt),
      enviado: enviado == null && nullToAbsent
          ? const Value.absent()
          : Value(enviado),
    );
  }

  Pedido copyWith(
          {String id,
          int idvendedor,
          int idcliente,
          String nomecliente,
          String datapedido,
          int total,
          String totalfmt,
          int enviado}) =>
      Pedido(
        id: id ?? this.id,
        idvendedor: idvendedor ?? this.idvendedor,
        idcliente: idcliente ?? this.idcliente,
        nomecliente: nomecliente ?? this.nomecliente,
        datapedido: datapedido ?? this.datapedido,
        total: total ?? this.total,
        totalfmt: totalfmt ?? this.totalfmt,
        enviado: enviado ?? this.enviado,
      );
  @override
  String toString() {
    return (StringBuffer('Pedido(')
          ..write('id: $id, ')
          ..write('idvendedor: $idvendedor, ')
          ..write('idcliente: $idcliente, ')
          ..write('nomecliente: $nomecliente, ')
          ..write('datapedido: $datapedido, ')
          ..write('total: $total, ')
          ..write('totalfmt: $totalfmt, ')
          ..write('enviado: $enviado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idvendedor.hashCode,
          $mrjc(
              idcliente.hashCode,
              $mrjc(
                  nomecliente.hashCode,
                  $mrjc(
                      datapedido.hashCode,
                      $mrjc(total.hashCode,
                          $mrjc(totalfmt.hashCode, enviado.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Pedido &&
          other.id == this.id &&
          other.idvendedor == this.idvendedor &&
          other.idcliente == this.idcliente &&
          other.nomecliente == this.nomecliente &&
          other.datapedido == this.datapedido &&
          other.total == this.total &&
          other.totalfmt == this.totalfmt &&
          other.enviado == this.enviado);
}

class PedidosCompanion extends UpdateCompanion<Pedido> {
  final Value<String> id;
  final Value<int> idvendedor;
  final Value<int> idcliente;
  final Value<String> nomecliente;
  final Value<String> datapedido;
  final Value<int> total;
  final Value<String> totalfmt;
  final Value<int> enviado;
  const PedidosCompanion({
    this.id = const Value.absent(),
    this.idvendedor = const Value.absent(),
    this.idcliente = const Value.absent(),
    this.nomecliente = const Value.absent(),
    this.datapedido = const Value.absent(),
    this.total = const Value.absent(),
    this.totalfmt = const Value.absent(),
    this.enviado = const Value.absent(),
  });
  PedidosCompanion.insert({
    @required String id,
    @required int idvendedor,
    @required int idcliente,
    @required String nomecliente,
    @required String datapedido,
    @required int total,
    @required String totalfmt,
    this.enviado = const Value.absent(),
  })  : id = Value(id),
        idvendedor = Value(idvendedor),
        idcliente = Value(idcliente),
        nomecliente = Value(nomecliente),
        datapedido = Value(datapedido),
        total = Value(total),
        totalfmt = Value(totalfmt);
  PedidosCompanion copyWith(
      {Value<String> id,
      Value<int> idvendedor,
      Value<int> idcliente,
      Value<String> nomecliente,
      Value<String> datapedido,
      Value<int> total,
      Value<String> totalfmt,
      Value<int> enviado}) {
    return PedidosCompanion(
      id: id ?? this.id,
      idvendedor: idvendedor ?? this.idvendedor,
      idcliente: idcliente ?? this.idcliente,
      nomecliente: nomecliente ?? this.nomecliente,
      datapedido: datapedido ?? this.datapedido,
      total: total ?? this.total,
      totalfmt: totalfmt ?? this.totalfmt,
      enviado: enviado ?? this.enviado,
    );
  }
}

class $PedidosTable extends Pedidos with TableInfo<$PedidosTable, Pedido> {
  final GeneratedDatabase _db;
  final String _alias;
  $PedidosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idvendedorMeta = const VerificationMeta('idvendedor');
  GeneratedIntColumn _idvendedor;
  @override
  GeneratedIntColumn get idvendedor => _idvendedor ??= _constructIdvendedor();
  GeneratedIntColumn _constructIdvendedor() {
    return GeneratedIntColumn(
      'idvendedor',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idclienteMeta = const VerificationMeta('idcliente');
  GeneratedIntColumn _idcliente;
  @override
  GeneratedIntColumn get idcliente => _idcliente ??= _constructIdcliente();
  GeneratedIntColumn _constructIdcliente() {
    return GeneratedIntColumn(
      'idcliente',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nomeclienteMeta =
      const VerificationMeta('nomecliente');
  GeneratedTextColumn _nomecliente;
  @override
  GeneratedTextColumn get nomecliente =>
      _nomecliente ??= _constructNomecliente();
  GeneratedTextColumn _constructNomecliente() {
    return GeneratedTextColumn(
      'nomecliente',
      $tableName,
      false,
    );
  }

  final VerificationMeta _datapedidoMeta = const VerificationMeta('datapedido');
  GeneratedTextColumn _datapedido;
  @override
  GeneratedTextColumn get datapedido => _datapedido ??= _constructDatapedido();
  GeneratedTextColumn _constructDatapedido() {
    return GeneratedTextColumn(
      'datapedido',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalMeta = const VerificationMeta('total');
  GeneratedIntColumn _total;
  @override
  GeneratedIntColumn get total => _total ??= _constructTotal();
  GeneratedIntColumn _constructTotal() {
    return GeneratedIntColumn(
      'total',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalfmtMeta = const VerificationMeta('totalfmt');
  GeneratedTextColumn _totalfmt;
  @override
  GeneratedTextColumn get totalfmt => _totalfmt ??= _constructTotalfmt();
  GeneratedTextColumn _constructTotalfmt() {
    return GeneratedTextColumn(
      'totalfmt',
      $tableName,
      false,
    );
  }

  final VerificationMeta _enviadoMeta = const VerificationMeta('enviado');
  GeneratedIntColumn _enviado;
  @override
  GeneratedIntColumn get enviado => _enviado ??= _constructEnviado();
  GeneratedIntColumn _constructEnviado() {
    return GeneratedIntColumn('enviado', $tableName, false,
        defaultValue: const Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        idvendedor,
        idcliente,
        nomecliente,
        datapedido,
        total,
        totalfmt,
        enviado
      ];
  @override
  $PedidosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'pedidos';
  @override
  final String actualTableName = 'pedidos';
  @override
  VerificationContext validateIntegrity(PedidosCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.idvendedor.present) {
      context.handle(_idvendedorMeta,
          idvendedor.isAcceptableValue(d.idvendedor.value, _idvendedorMeta));
    } else if (isInserting) {
      context.missing(_idvendedorMeta);
    }
    if (d.idcliente.present) {
      context.handle(_idclienteMeta,
          idcliente.isAcceptableValue(d.idcliente.value, _idclienteMeta));
    } else if (isInserting) {
      context.missing(_idclienteMeta);
    }
    if (d.nomecliente.present) {
      context.handle(_nomeclienteMeta,
          nomecliente.isAcceptableValue(d.nomecliente.value, _nomeclienteMeta));
    } else if (isInserting) {
      context.missing(_nomeclienteMeta);
    }
    if (d.datapedido.present) {
      context.handle(_datapedidoMeta,
          datapedido.isAcceptableValue(d.datapedido.value, _datapedidoMeta));
    } else if (isInserting) {
      context.missing(_datapedidoMeta);
    }
    if (d.total.present) {
      context.handle(
          _totalMeta, total.isAcceptableValue(d.total.value, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (d.totalfmt.present) {
      context.handle(_totalfmtMeta,
          totalfmt.isAcceptableValue(d.totalfmt.value, _totalfmtMeta));
    } else if (isInserting) {
      context.missing(_totalfmtMeta);
    }
    if (d.enviado.present) {
      context.handle(_enviadoMeta,
          enviado.isAcceptableValue(d.enviado.value, _enviadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pedido map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Pedido.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(PedidosCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.idvendedor.present) {
      map['idvendedor'] = Variable<int, IntType>(d.idvendedor.value);
    }
    if (d.idcliente.present) {
      map['idcliente'] = Variable<int, IntType>(d.idcliente.value);
    }
    if (d.nomecliente.present) {
      map['nomecliente'] = Variable<String, StringType>(d.nomecliente.value);
    }
    if (d.datapedido.present) {
      map['datapedido'] = Variable<String, StringType>(d.datapedido.value);
    }
    if (d.total.present) {
      map['total'] = Variable<int, IntType>(d.total.value);
    }
    if (d.totalfmt.present) {
      map['totalfmt'] = Variable<String, StringType>(d.totalfmt.value);
    }
    if (d.enviado.present) {
      map['enviado'] = Variable<int, IntType>(d.enviado.value);
    }
    return map;
  }

  @override
  $PedidosTable createAlias(String alias) {
    return $PedidosTable(_db, alias);
  }
}

class Iten extends DataClass implements Insertable<Iten> {
  final int id;
  final String idpedido;
  final int idproduto;
  final int qtde;
  final int valor;
  final String totalfmt;
  final String nome;
  final int enviado;
  Iten(
      {@required this.id,
      @required this.idpedido,
      @required this.idproduto,
      @required this.qtde,
      @required this.valor,
      @required this.totalfmt,
      @required this.nome,
      @required this.enviado});
  factory Iten.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Iten(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idpedido: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}idpedido']),
      idproduto:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}idproduto']),
      qtde: intType.mapFromDatabaseResponse(data['${effectivePrefix}qtde']),
      valor: intType.mapFromDatabaseResponse(data['${effectivePrefix}valor']),
      totalfmt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}totalfmt']),
      nome: stringType.mapFromDatabaseResponse(data['${effectivePrefix}nome']),
      enviado:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}enviado']),
    );
  }
  factory Iten.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Iten(
      id: serializer.fromJson<int>(json['id']),
      idpedido: serializer.fromJson<String>(json['idpedido']),
      idproduto: serializer.fromJson<int>(json['idproduto']),
      qtde: serializer.fromJson<int>(json['qtde']),
      valor: serializer.fromJson<int>(json['valor']),
      totalfmt: serializer.fromJson<String>(json['totalfmt']),
      nome: serializer.fromJson<String>(json['nome']),
      enviado: serializer.fromJson<int>(json['enviado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idpedido': serializer.toJson<String>(idpedido),
      'idproduto': serializer.toJson<int>(idproduto),
      'qtde': serializer.toJson<int>(qtde),
      'valor': serializer.toJson<int>(valor),
      'totalfmt': serializer.toJson<String>(totalfmt),
      'nome': serializer.toJson<String>(nome),
      'enviado': serializer.toJson<int>(enviado),
    };
  }

  @override
  ItensCompanion createCompanion(bool nullToAbsent) {
    return ItensCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idpedido: idpedido == null && nullToAbsent
          ? const Value.absent()
          : Value(idpedido),
      idproduto: idproduto == null && nullToAbsent
          ? const Value.absent()
          : Value(idproduto),
      qtde: qtde == null && nullToAbsent ? const Value.absent() : Value(qtde),
      valor:
          valor == null && nullToAbsent ? const Value.absent() : Value(valor),
      totalfmt: totalfmt == null && nullToAbsent
          ? const Value.absent()
          : Value(totalfmt),
      nome: nome == null && nullToAbsent ? const Value.absent() : Value(nome),
      enviado: enviado == null && nullToAbsent
          ? const Value.absent()
          : Value(enviado),
    );
  }

  Iten copyWith(
          {int id,
          String idpedido,
          int idproduto,
          int qtde,
          int valor,
          String totalfmt,
          String nome,
          int enviado}) =>
      Iten(
        id: id ?? this.id,
        idpedido: idpedido ?? this.idpedido,
        idproduto: idproduto ?? this.idproduto,
        qtde: qtde ?? this.qtde,
        valor: valor ?? this.valor,
        totalfmt: totalfmt ?? this.totalfmt,
        nome: nome ?? this.nome,
        enviado: enviado ?? this.enviado,
      );
  @override
  String toString() {
    return (StringBuffer('Iten(')
          ..write('id: $id, ')
          ..write('idpedido: $idpedido, ')
          ..write('idproduto: $idproduto, ')
          ..write('qtde: $qtde, ')
          ..write('valor: $valor, ')
          ..write('totalfmt: $totalfmt, ')
          ..write('nome: $nome, ')
          ..write('enviado: $enviado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idpedido.hashCode,
          $mrjc(
              idproduto.hashCode,
              $mrjc(
                  qtde.hashCode,
                  $mrjc(
                      valor.hashCode,
                      $mrjc(totalfmt.hashCode,
                          $mrjc(nome.hashCode, enviado.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Iten &&
          other.id == this.id &&
          other.idpedido == this.idpedido &&
          other.idproduto == this.idproduto &&
          other.qtde == this.qtde &&
          other.valor == this.valor &&
          other.totalfmt == this.totalfmt &&
          other.nome == this.nome &&
          other.enviado == this.enviado);
}

class ItensCompanion extends UpdateCompanion<Iten> {
  final Value<int> id;
  final Value<String> idpedido;
  final Value<int> idproduto;
  final Value<int> qtde;
  final Value<int> valor;
  final Value<String> totalfmt;
  final Value<String> nome;
  final Value<int> enviado;
  const ItensCompanion({
    this.id = const Value.absent(),
    this.idpedido = const Value.absent(),
    this.idproduto = const Value.absent(),
    this.qtde = const Value.absent(),
    this.valor = const Value.absent(),
    this.totalfmt = const Value.absent(),
    this.nome = const Value.absent(),
    this.enviado = const Value.absent(),
  });
  ItensCompanion.insert({
    this.id = const Value.absent(),
    @required String idpedido,
    @required int idproduto,
    @required int qtde,
    @required int valor,
    @required String totalfmt,
    @required String nome,
    this.enviado = const Value.absent(),
  })  : idpedido = Value(idpedido),
        idproduto = Value(idproduto),
        qtde = Value(qtde),
        valor = Value(valor),
        totalfmt = Value(totalfmt),
        nome = Value(nome);
  ItensCompanion copyWith(
      {Value<int> id,
      Value<String> idpedido,
      Value<int> idproduto,
      Value<int> qtde,
      Value<int> valor,
      Value<String> totalfmt,
      Value<String> nome,
      Value<int> enviado}) {
    return ItensCompanion(
      id: id ?? this.id,
      idpedido: idpedido ?? this.idpedido,
      idproduto: idproduto ?? this.idproduto,
      qtde: qtde ?? this.qtde,
      valor: valor ?? this.valor,
      totalfmt: totalfmt ?? this.totalfmt,
      nome: nome ?? this.nome,
      enviado: enviado ?? this.enviado,
    );
  }
}

class $ItensTable extends Itens with TableInfo<$ItensTable, Iten> {
  final GeneratedDatabase _db;
  final String _alias;
  $ItensTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _idpedidoMeta = const VerificationMeta('idpedido');
  GeneratedTextColumn _idpedido;
  @override
  GeneratedTextColumn get idpedido => _idpedido ??= _constructIdpedido();
  GeneratedTextColumn _constructIdpedido() {
    return GeneratedTextColumn(
      'idpedido',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idprodutoMeta = const VerificationMeta('idproduto');
  GeneratedIntColumn _idproduto;
  @override
  GeneratedIntColumn get idproduto => _idproduto ??= _constructIdproduto();
  GeneratedIntColumn _constructIdproduto() {
    return GeneratedIntColumn(
      'idproduto',
      $tableName,
      false,
    );
  }

  final VerificationMeta _qtdeMeta = const VerificationMeta('qtde');
  GeneratedIntColumn _qtde;
  @override
  GeneratedIntColumn get qtde => _qtde ??= _constructQtde();
  GeneratedIntColumn _constructQtde() {
    return GeneratedIntColumn(
      'qtde',
      $tableName,
      false,
    );
  }

  final VerificationMeta _valorMeta = const VerificationMeta('valor');
  GeneratedIntColumn _valor;
  @override
  GeneratedIntColumn get valor => _valor ??= _constructValor();
  GeneratedIntColumn _constructValor() {
    return GeneratedIntColumn(
      'valor',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalfmtMeta = const VerificationMeta('totalfmt');
  GeneratedTextColumn _totalfmt;
  @override
  GeneratedTextColumn get totalfmt => _totalfmt ??= _constructTotalfmt();
  GeneratedTextColumn _constructTotalfmt() {
    return GeneratedTextColumn(
      'totalfmt',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  GeneratedTextColumn _nome;
  @override
  GeneratedTextColumn get nome => _nome ??= _constructNome();
  GeneratedTextColumn _constructNome() {
    return GeneratedTextColumn('nome', $tableName, false, maxTextLength: 50);
  }

  final VerificationMeta _enviadoMeta = const VerificationMeta('enviado');
  GeneratedIntColumn _enviado;
  @override
  GeneratedIntColumn get enviado => _enviado ??= _constructEnviado();
  GeneratedIntColumn _constructEnviado() {
    return GeneratedIntColumn('enviado', $tableName, false,
        defaultValue: const Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, idpedido, idproduto, qtde, valor, totalfmt, nome, enviado];
  @override
  $ItensTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'itens';
  @override
  final String actualTableName = 'itens';
  @override
  VerificationContext validateIntegrity(ItensCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.idpedido.present) {
      context.handle(_idpedidoMeta,
          idpedido.isAcceptableValue(d.idpedido.value, _idpedidoMeta));
    } else if (isInserting) {
      context.missing(_idpedidoMeta);
    }
    if (d.idproduto.present) {
      context.handle(_idprodutoMeta,
          idproduto.isAcceptableValue(d.idproduto.value, _idprodutoMeta));
    } else if (isInserting) {
      context.missing(_idprodutoMeta);
    }
    if (d.qtde.present) {
      context.handle(
          _qtdeMeta, qtde.isAcceptableValue(d.qtde.value, _qtdeMeta));
    } else if (isInserting) {
      context.missing(_qtdeMeta);
    }
    if (d.valor.present) {
      context.handle(
          _valorMeta, valor.isAcceptableValue(d.valor.value, _valorMeta));
    } else if (isInserting) {
      context.missing(_valorMeta);
    }
    if (d.totalfmt.present) {
      context.handle(_totalfmtMeta,
          totalfmt.isAcceptableValue(d.totalfmt.value, _totalfmtMeta));
    } else if (isInserting) {
      context.missing(_totalfmtMeta);
    }
    if (d.nome.present) {
      context.handle(
          _nomeMeta, nome.isAcceptableValue(d.nome.value, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (d.enviado.present) {
      context.handle(_enviadoMeta,
          enviado.isAcceptableValue(d.enviado.value, _enviadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Iten map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Iten.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ItensCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.idpedido.present) {
      map['idpedido'] = Variable<String, StringType>(d.idpedido.value);
    }
    if (d.idproduto.present) {
      map['idproduto'] = Variable<int, IntType>(d.idproduto.value);
    }
    if (d.qtde.present) {
      map['qtde'] = Variable<int, IntType>(d.qtde.value);
    }
    if (d.valor.present) {
      map['valor'] = Variable<int, IntType>(d.valor.value);
    }
    if (d.totalfmt.present) {
      map['totalfmt'] = Variable<String, StringType>(d.totalfmt.value);
    }
    if (d.nome.present) {
      map['nome'] = Variable<String, StringType>(d.nome.value);
    }
    if (d.enviado.present) {
      map['enviado'] = Variable<int, IntType>(d.enviado.value);
    }
    return map;
  }

  @override
  $ItensTable createAlias(String alias) {
    return $ItensTable(_db, alias);
  }
}

abstract class _$Basedados extends GeneratedDatabase {
  _$Basedados(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CategoriasTable _categorias;
  $CategoriasTable get categorias => _categorias ??= $CategoriasTable(this);
  $ProdutosTable _produtos;
  $ProdutosTable get produtos => _produtos ??= $ProdutosTable(this);
  $ClientesTable _clientes;
  $ClientesTable get clientes => _clientes ??= $ClientesTable(this);
  $PedidosTable _pedidos;
  $PedidosTable get pedidos => _pedidos ??= $PedidosTable(this);
  $ItensTable _itens;
  $ItensTable get itens => _itens ??= $ItensTable(this);
  Selectable<int> contaCategoriasQuery() {
    return customSelectQuery('SELECT COUNT(*) FROM categorias AS "TOTAL";',
        variables: [],
        readsFrom: {categorias}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> contaCategorias() {
    return contaCategoriasQuery().get();
  }

  Stream<List<int>> watchContaCategorias() {
    return contaCategoriasQuery().watch();
  }

  Selectable<int> contaProdutosQuery() {
    return customSelectQuery('SELECT COUNT(*) FROM produtos AS "TOTAL";',
        variables: [],
        readsFrom: {produtos}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> contaProdutos() {
    return contaProdutosQuery().get();
  }

  Stream<List<int>> watchContaProdutos() {
    return contaProdutosQuery().watch();
  }

  Selectable<int> contaClientesQuery() {
    return customSelectQuery('SELECT COUNT(*) FROM clientes AS "TOTAL";',
        variables: [],
        readsFrom: {clientes}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> contaClientes() {
    return contaClientesQuery().get();
  }

  Stream<List<int>> watchContaClientes() {
    return contaClientesQuery().watch();
  }

  Selectable<int> contaPedidosAllQuery() {
    return customSelectQuery('SELECT COUNT(*) FROM pedidos AS "TOTAL";',
        variables: [],
        readsFrom: {pedidos}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> contaPedidosAll() {
    return contaPedidosAllQuery().get();
  }

  Stream<List<int>> watchContaPedidosAll() {
    return contaPedidosAllQuery().watch();
  }

  Selectable<int> contaPedidosEnviadoQuery() {
    return customSelectQuery(
        'SELECT COUNT(*) FROM pedidos AS "TOTAL" WHERE enviado = 1;',
        variables: [],
        readsFrom: {pedidos}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> contaPedidosEnviado() {
    return contaPedidosEnviadoQuery().get();
  }

  Stream<List<int>> watchContaPedidosEnviado() {
    return contaPedidosEnviadoQuery().watch();
  }

  Selectable<int> contaPedidosLocalQuery() {
    return customSelectQuery(
        'SELECT COUNT(*) FROM pedidos AS "TOTAL" WHERE enviado = 0;',
        variables: [],
        readsFrom: {pedidos}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> contaPedidosLocal() {
    return contaPedidosLocalQuery().get();
  }

  Stream<List<int>> watchContaPedidosLocal() {
    return contaPedidosLocalQuery().watch();
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categorias, produtos, clientes, pedidos, itens];
}
