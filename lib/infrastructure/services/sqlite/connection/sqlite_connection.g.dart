// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sqlite_connection.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorSQLiteConnection {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SQLiteConnectionBuilder databaseBuilder(String name) =>
      _$SQLiteConnectionBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SQLiteConnectionBuilder inMemoryDatabaseBuilder() =>
      _$SQLiteConnectionBuilder(null);
}

class _$SQLiteConnectionBuilder {
  _$SQLiteConnectionBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$SQLiteConnectionBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$SQLiteConnectionBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<SQLiteConnection> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$SQLiteConnection();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$SQLiteConnection extends SQLiteConnection {
  _$SQLiteConnection([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FormaPagtoDAO? _formaPagtoDAOInstance;

  ClienteDAO? _clienteDAOInstance;

  UsuuarioDAO? _usuarioDAOInstance;

  ProdutoDAO? _produtoDAOInstance;

  EmpresaDAO? _empresaDAOInstance;

  CaixaDAO? _caixaDAOInstance;

  VendaDAO? _vendaDAOInstance;

  VendaItemDAO? _vendaItemDAOInstance;

  ProdutoGrupoDAO? _produtoGrupoDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `forma_pagto` (`id` INTEGER, `descricao` TEXT, `cod_sefaz` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cliente` (`id` INTEGER, `nome` TEXT, `cnpjcpf` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `usuario` (`id` INTEGER, `usuario` TEXT, `senha` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `produto` (`id` INTEGER, `descricao` TEXT, `gtin` TEXT, `un` TEXT, `preco` REAL, `ncm` TEXT, `cest` TEXT, `cfop` TEXT, `cst_icms` TEXT, `origem` TEXT, `cst_pis` TEXT, `cst_cofins` TEXT, `ibpt_federal` REAL, `ibpt_estadual` REAL, `ibpt_municipal` REAL, `aliq_icms` REAL, `aliq_pis` REAL, `aliq_cofins` REAL, `img` TEXT, `grupo` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `empresa` (`id` INTEGER, `nome` TEXT, `cnpj` TEXT, `ie` TEXT, `logradouro` TEXT, `numero` TEXT, `bairro` TEXT, `cidade` TEXT, `uf` TEXT, `ibge` TEXT, `cep` TEXT, `crt` INTEGER, `forma_emissao` INTEGER, `serie` TEXT, `ultimo_doc` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `caixa` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `terminal` TEXT, `abertura` TEXT, `valor_abertura` REAL, `id_usuario` INTEGER, `fechamento` TEXT, `valor_fechamento` REAL, `diferenca` REAL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `venda` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `cuf` INTEGER, `cnf` INTEGER, `natope` TEXT, `modelo` INTEGER, `serie` INTEGER, `nnf` INTEGER, `dhemi` TEXT, `dhsaient` TEXT, `tpnf` INTEGER, `iddest` INTEGER, `cmunfg` TEXT, `tpimp` INTEGER, `tpemis` INTEGER, `cdv` INTEGER, `tpamb` INTEGER, `finnfe` INTEGER, `indfinal` INTEGER, `indpres` INTEGER, `procemi` INTEGER, `verproc` TEXT, `dhcont` TEXT, `xjust` TEXT, `cnpjemi` TEXT, `xnomeemi` TEXT, `xfant` TEXT, `xlgremi` TEXT, `nroemi` TEXT, `xcplemi` TEXT, `xbairroemi` TEXT, `cmunemi` TEXT, `xmunemi` TEXT, `ufemi` TEXT, `cepemi` TEXT, `cpaisemi` TEXT, `xpaisemi` TEXT, `foneemi` TEXT, `ieemi` TEXT, `iest` TEXT, `imemi` TEXT, `cnae` TEXT, `crt` TEXT, `cnpjdest` TEXT, `cpfdest` TEXT, `xlgrdest` TEXT, `nrodest` TEXT, `xcpldest` TEXT, `xbairrodest` TEXT, `cmundest` TEXT, `xmundest` TEXT, `ufdest` TEXT, `cepdest` TEXT, `cpaisdest` TEXT, `xpaisdest` TEXT, `fonedest` TEXT, `indiedest` TEXT, `iedest` TEXT, `isuf` TEXT, `imdest` TEXT, `email` TEXT, `vbc` REAL, `vicms` REAL, `vbcst` REAL, `vst` REAL, `vprod` REAL, `vfrete` REAL, `vseg` REAL, `vdesc` REAL, `vii` REAL, `vipi` REAL, `vpis` REAL, `vcofins` REAL, `voutro` REAL, `vnf` REAL, `vtottrib` REAL, `vicmsdeson` REAL, `vicmsufdestopc` REAL, `vicmsufremet` REAL, `vfcpufdestopc` REAL, `vfcp` REAL, `vfcpst` REAL, `vfcpstret` REAL, `vipidevol` REAL, `modfrete` TEXT, `cnpjtransp` TEXT, `cpftransp` TEXT, `xnometransp` TEXT, `ietransp` TEXT, `xender` TEXT, `xmuntransp` TEXT, `uftransp` TEXT, `infadfisco` TEXT, `infcpl` TEXT, `nfat` TEXT, `vorig` REAL, `vdescfatura` REAL, `vliq` REAL, `versao` TEXT, `chavenf` TEXT, `statusnfe` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `venda_item` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `id_venda` INTEGER, `cprod` TEXT, `cean` TEXT, `xprod` TEXT, `ncm` TEXT, `cest` TEXT, `cfop` INTEGER, `ucom` TEXT, `qcom` REAL, `vuncom` REAL, `vprod` REAL, `ceantrib` TEXT, `utrib` TEXT, `vuntrib` REAL, `vfrete` REAL, `vseg` REAL, `vdesc` REAL, `voutro` REAL, `indtot` INTEGER, `orig` TEXT, `csticms` TEXT, `modbc` INTEGER, `predbc` REAL, `vbcicms` REAL, `picms` REAL, `vicms` REAL, `modbcst` INTEGER, `pmvast` REAL, `predbcst` REAL, `vbcst` REAL, `picmsst` REAL, `vicmsst` REAL, `vbcstret` REAL, `vicmsstret` REAL, `vbcstdest` REAL, `vicmsstdest` REAL, `pbcop` REAL, `pcredsn` REAL, `vcredicmssn` REAL, `vicmsdeson` REAL, `vicmsop` REAL, `pdif` REAL, `vicmsdif` REAL, `vbcfcp` REAL, `pfcp` REAL, `vfcp` REAL, `vbcfcpstret` REAL, `pfcpstret` REAL, `vfcpstret` REAL, `pst` REAL, `cenq` TEXT, `cstipi` TEXT, `vbcipi` REAL, `pipi` REAL, `vipi` REAL, `qunid` REAL, `vunid` REAL, `cstpis` TEXT, `vbcpis` REAL, `ppis` REAL, `vpis` REAL, `qbcprodpis` REAL, `valiqprodpis` REAL, `cstcofins` TEXT, `vbccofins` REAL, `pcofins` REAL, `vcofins` REAL, `qbcprodcofins` REAL, `valiqprodcofins` REAL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `produto_grupo` (`id` INTEGER, `descricao` TEXT, `color` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FormaPagtoDAO get formaPagtoDAO {
    return _formaPagtoDAOInstance ??= _$FormaPagtoDAO(database, changeListener);
  }

  @override
  ClienteDAO get clienteDAO {
    return _clienteDAOInstance ??= _$ClienteDAO(database, changeListener);
  }

  @override
  UsuuarioDAO get usuarioDAO {
    return _usuarioDAOInstance ??= _$UsuuarioDAO(database, changeListener);
  }

  @override
  ProdutoDAO get produtoDAO {
    return _produtoDAOInstance ??= _$ProdutoDAO(database, changeListener);
  }

  @override
  EmpresaDAO get empresaDAO {
    return _empresaDAOInstance ??= _$EmpresaDAO(database, changeListener);
  }

  @override
  CaixaDAO get caixaDAO {
    return _caixaDAOInstance ??= _$CaixaDAO(database, changeListener);
  }

  @override
  VendaDAO get vendaDAO {
    return _vendaDAOInstance ??= _$VendaDAO(database, changeListener);
  }

  @override
  VendaItemDAO get vendaItemDAO {
    return _vendaItemDAOInstance ??= _$VendaItemDAO(database, changeListener);
  }

  @override
  ProdutoGrupoDAO get produtoGrupoDAO {
    return _produtoGrupoDAOInstance ??=
        _$ProdutoGrupoDAO(database, changeListener);
  }
}

class _$FormaPagtoDAO extends FormaPagtoDAO {
  _$FormaPagtoDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _formaPagtoEntityInsertionAdapter = InsertionAdapter(
            database,
            'forma_pagto',
            (FormaPagtoEntity item) => <String, Object?>{
                  'id': item.id,
                  'descricao': item.descricao,
                  'cod_sefaz': item.codSefaz
                },
            changeListener),
        _formaPagtoEntityUpdateAdapter = UpdateAdapter(
            database,
            'forma_pagto',
            ['id'],
            (FormaPagtoEntity item) => <String, Object?>{
                  'id': item.id,
                  'descricao': item.descricao,
                  'cod_sefaz': item.codSefaz
                },
            changeListener),
        _formaPagtoEntityDeletionAdapter = DeletionAdapter(
            database,
            'forma_pagto',
            ['id'],
            (FormaPagtoEntity item) => <String, Object?>{
                  'id': item.id,
                  'descricao': item.descricao,
                  'cod_sefaz': item.codSefaz
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FormaPagtoEntity> _formaPagtoEntityInsertionAdapter;

  final UpdateAdapter<FormaPagtoEntity> _formaPagtoEntityUpdateAdapter;

  final DeletionAdapter<FormaPagtoEntity> _formaPagtoEntityDeletionAdapter;

  @override
  Future<List<FormaPagtoEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT *   FROM forma_pagto   ORDER BY id',
        mapper: (Map<String, Object?> row) => FormaPagtoEntity(
            id: row['id'] as int?,
            descricao: row['descricao'] as String?,
            codSefaz: row['cod_sefaz'] as int?));
  }

  @override
  Stream<List<FormaPagtoEntity>> findAllStream() {
    return _queryAdapter.queryListStream(
        'SELECT *   FROM forma_pagto   ORDER BY id',
        mapper: (Map<String, Object?> row) => FormaPagtoEntity(
            id: row['id'] as int?,
            descricao: row['descricao'] as String?,
            codSefaz: row['cod_sefaz'] as int?),
        queryableName: 'forma_pagto',
        isView: false);
  }

  @override
  Future<List<FormaPagtoEntity>> findByName(String descricao) async {
    return _queryAdapter.queryList(
        'SELECT *   FROM forma_pagto   WHERE descricao like \'%\' || ?1 || \'%\'   ORDER BY id',
        mapper: (Map<String, Object?> row) => FormaPagtoEntity(id: row['id'] as int?, descricao: row['descricao'] as String?, codSefaz: row['cod_sefaz'] as int?),
        arguments: [descricao]);
  }

  @override
  Stream<List<FormaPagtoEntity>> findByNameStream(String descricao) {
    return _queryAdapter.queryListStream(
        'SELECT *   FROM forma_pagto   WHERE descricao like \'%\' || ?1 || \'%\'   ORDER BY id',
        mapper: (Map<String, Object?> row) => FormaPagtoEntity(
            id: row['id'] as int?,
            descricao: row['descricao'] as String?,
            codSefaz: row['cod_sefaz'] as int?),
        arguments: [descricao],
        queryableName: 'forma_pagto',
        isView: false);
  }

  @override
  Future<FormaPagtoEntity?> findById(int id) async {
    return _queryAdapter.query(
        'SELECT *   FROM forma_pagto   WHERE id = ?1   ORDER BY id',
        mapper: (Map<String, Object?> row) => FormaPagtoEntity(
            id: row['id'] as int?,
            descricao: row['descricao'] as String?,
            codSefaz: row['cod_sefaz'] as int?),
        arguments: [id]);
  }

  @override
  Future<void> deleteDataById(int id) async {
    await _queryAdapter.queryNoReturn(
        'DELETE    FROM forma_pagto    WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertData(FormaPagtoEntity entityInstance) async {
    await _formaPagtoEntityInsertionAdapter.insert(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertListData(List<FormaPagtoEntity> entityInstance) async {
    await _formaPagtoEntityInsertionAdapter.insertList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateData(FormaPagtoEntity entityInstance) async {
    await _formaPagtoEntityUpdateAdapter.update(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateListData(List<FormaPagtoEntity> entityInstance) async {
    await _formaPagtoEntityUpdateAdapter.updateList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteData(FormaPagtoEntity entityInstance) async {
    await _formaPagtoEntityDeletionAdapter.delete(entityInstance);
  }
}

class _$ClienteDAO extends ClienteDAO {
  _$ClienteDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _clienteEntityInsertionAdapter = InsertionAdapter(
            database,
            'cliente',
            (ClienteEntity item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'cnpjcpf': item.cnpjCpf
                },
            changeListener),
        _clienteEntityUpdateAdapter = UpdateAdapter(
            database,
            'cliente',
            ['id'],
            (ClienteEntity item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'cnpjcpf': item.cnpjCpf
                },
            changeListener),
        _clienteEntityDeletionAdapter = DeletionAdapter(
            database,
            'cliente',
            ['id'],
            (ClienteEntity item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'cnpjcpf': item.cnpjCpf
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ClienteEntity> _clienteEntityInsertionAdapter;

  final UpdateAdapter<ClienteEntity> _clienteEntityUpdateAdapter;

  final DeletionAdapter<ClienteEntity> _clienteEntityDeletionAdapter;

  @override
  Future<List<ClienteEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT *   FROM cliente   ORDER BY id',
        mapper: (Map<String, Object?> row) => ClienteEntity(
            id: row['id'] as int?,
            nome: row['nome'] as String?,
            cnpjCpf: row['cnpjcpf'] as String?));
  }

  @override
  Stream<List<ClienteEntity>> findAllStream() {
    return _queryAdapter.queryListStream(
        'SELECT *   FROM cliente   ORDER BY id',
        mapper: (Map<String, Object?> row) => ClienteEntity(
            id: row['id'] as int?,
            nome: row['nome'] as String?,
            cnpjCpf: row['cnpjcpf'] as String?),
        queryableName: 'cliente',
        isView: false);
  }

  @override
  Future<List<ClienteEntity>> findByName(String nome) async {
    return _queryAdapter.queryList(
        'SELECT *   FROM cliente   WHERE nome like \'%\' || ?1 || \'%\'   ORDER BY id',
        mapper: (Map<String, Object?> row) => ClienteEntity(id: row['id'] as int?, nome: row['nome'] as String?, cnpjCpf: row['cnpjcpf'] as String?),
        arguments: [nome]);
  }

  @override
  Stream<List<ClienteEntity>> findByNameStream(String nome) {
    return _queryAdapter.queryListStream(
        'SELECT *   FROM cliente   WHERE nome like \'%\' || ?1 || \'%\'   ORDER BY id',
        mapper: (Map<String, Object?> row) => ClienteEntity(
            id: row['id'] as int?,
            nome: row['nome'] as String?,
            cnpjCpf: row['cnpjcpf'] as String?),
        arguments: [nome],
        queryableName: 'cliente',
        isView: false);
  }

  @override
  Future<ClienteEntity?> findById(int id) async {
    return _queryAdapter.query(
        'SELECT *   FROM cliente   WHERE id = ?1   ORDER BY id',
        mapper: (Map<String, Object?> row) => ClienteEntity(
            id: row['id'] as int?,
            nome: row['nome'] as String?,
            cnpjCpf: row['cnpjcpf'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> deleteDataById(int id) async {
    await _queryAdapter.queryNoReturn('DELETE    FROM cliente    WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertData(ClienteEntity entityInstance) async {
    await _clienteEntityInsertionAdapter.insert(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertListData(List<ClienteEntity> entityInstance) async {
    await _clienteEntityInsertionAdapter.insertList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateData(ClienteEntity entityInstance) async {
    await _clienteEntityUpdateAdapter.update(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateListData(List<ClienteEntity> entityInstance) async {
    await _clienteEntityUpdateAdapter.updateList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteData(ClienteEntity entityInstance) async {
    await _clienteEntityDeletionAdapter.delete(entityInstance);
  }
}

class _$UsuuarioDAO extends UsuuarioDAO {
  _$UsuuarioDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _usuarioEntityInsertionAdapter = InsertionAdapter(
            database,
            'usuario',
            (UsuarioEntity item) => <String, Object?>{
                  'id': item.id,
                  'usuario': item.usuario,
                  'senha': item.senha
                },
            changeListener),
        _usuarioEntityUpdateAdapter = UpdateAdapter(
            database,
            'usuario',
            ['id'],
            (UsuarioEntity item) => <String, Object?>{
                  'id': item.id,
                  'usuario': item.usuario,
                  'senha': item.senha
                },
            changeListener),
        _usuarioEntityDeletionAdapter = DeletionAdapter(
            database,
            'usuario',
            ['id'],
            (UsuarioEntity item) => <String, Object?>{
                  'id': item.id,
                  'usuario': item.usuario,
                  'senha': item.senha
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UsuarioEntity> _usuarioEntityInsertionAdapter;

  final UpdateAdapter<UsuarioEntity> _usuarioEntityUpdateAdapter;

  final DeletionAdapter<UsuarioEntity> _usuarioEntityDeletionAdapter;

  @override
  Future<List<UsuarioEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT *   FROM usuario   ORDER BY id',
        mapper: (Map<String, Object?> row) => UsuarioEntity(
            id: row['id'] as int?,
            usuario: row['usuario'] as String?,
            senha: row['senha'] as String?));
  }

  @override
  Stream<List<UsuarioEntity>> findAllStream() {
    return _queryAdapter.queryListStream(
        'SELECT *   FROM usuario   ORDER BY id',
        mapper: (Map<String, Object?> row) => UsuarioEntity(
            id: row['id'] as int?,
            usuario: row['usuario'] as String?,
            senha: row['senha'] as String?),
        queryableName: 'usuario',
        isView: false);
  }

  @override
  Future<List<UsuarioEntity>> findByName(String usuario) async {
    return _queryAdapter.queryList(
        'SELECT *   FROM usuario   WHERE usuario like \'%\' || ?1 || \'%\'   ORDER BY id',
        mapper: (Map<String, Object?> row) => UsuarioEntity(id: row['id'] as int?, usuario: row['usuario'] as String?, senha: row['senha'] as String?),
        arguments: [usuario]);
  }

  @override
  Future<UsuarioEntity?> login(String usuario) async {
    return _queryAdapter.query(
        'SELECT *   FROM usuario   WHERE usuario = ?1   ORDER BY id',
        mapper: (Map<String, Object?> row) => UsuarioEntity(
            id: row['id'] as int?,
            usuario: row['usuario'] as String?,
            senha: row['senha'] as String?),
        arguments: [usuario]);
  }

  @override
  Stream<List<UsuarioEntity>> findByNameStream(String usuario) {
    return _queryAdapter.queryListStream(
        'SELECT *   FROM usuario   WHERE usuario like \'%\' || ?1 || \'%\'   ORDER BY id',
        mapper: (Map<String, Object?> row) => UsuarioEntity(
            id: row['id'] as int?,
            usuario: row['usuario'] as String?,
            senha: row['senha'] as String?),
        arguments: [usuario],
        queryableName: 'usuario',
        isView: false);
  }

  @override
  Future<UsuarioEntity?> findById(int id) async {
    return _queryAdapter.query(
        'SELECT *   FROM usuario   WHERE id = ?1   ORDER BY id',
        mapper: (Map<String, Object?> row) => UsuarioEntity(
            id: row['id'] as int?,
            usuario: row['usuario'] as String?,
            senha: row['senha'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> deleteDataById(int id) async {
    await _queryAdapter.queryNoReturn('DELETE    FROM usuario    WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertData(UsuarioEntity entityInstance) async {
    await _usuarioEntityInsertionAdapter.insert(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertListData(List<UsuarioEntity> entityInstance) async {
    await _usuarioEntityInsertionAdapter.insertList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateData(UsuarioEntity entityInstance) async {
    await _usuarioEntityUpdateAdapter.update(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateListData(List<UsuarioEntity> entityInstance) async {
    await _usuarioEntityUpdateAdapter.updateList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteData(UsuarioEntity entityInstance) async {
    await _usuarioEntityDeletionAdapter.delete(entityInstance);
  }
}

class _$ProdutoDAO extends ProdutoDAO {
  _$ProdutoDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _produtosEntityInsertionAdapter = InsertionAdapter(
            database,
            'produto',
            (ProdutosEntity item) => <String, Object?>{
                  'id': item.id,
                  'descricao': item.descricao,
                  'gtin': item.gtin,
                  'un': item.un,
                  'preco': item.preco,
                  'ncm': item.ncm,
                  'cest': item.cest,
                  'cfop': item.cfop,
                  'cst_icms': item.cstIcms,
                  'origem': item.origem,
                  'cst_pis': item.cstPis,
                  'cst_cofins': item.cstCofins,
                  'ibpt_federal': item.ibptFederal,
                  'ibpt_estadual': item.ibptEstadual,
                  'ibpt_municipal': item.ibptMunicipal,
                  'aliq_icms': item.aliqIcms,
                  'aliq_pis': item.aliqPis,
                  'aliq_cofins': item.aliqCofins,
                  'img': item.img,
                  'grupo': item.grupo
                },
            changeListener),
        _produtosEntityUpdateAdapter = UpdateAdapter(
            database,
            'produto',
            ['id'],
            (ProdutosEntity item) => <String, Object?>{
                  'id': item.id,
                  'descricao': item.descricao,
                  'gtin': item.gtin,
                  'un': item.un,
                  'preco': item.preco,
                  'ncm': item.ncm,
                  'cest': item.cest,
                  'cfop': item.cfop,
                  'cst_icms': item.cstIcms,
                  'origem': item.origem,
                  'cst_pis': item.cstPis,
                  'cst_cofins': item.cstCofins,
                  'ibpt_federal': item.ibptFederal,
                  'ibpt_estadual': item.ibptEstadual,
                  'ibpt_municipal': item.ibptMunicipal,
                  'aliq_icms': item.aliqIcms,
                  'aliq_pis': item.aliqPis,
                  'aliq_cofins': item.aliqCofins,
                  'img': item.img,
                  'grupo': item.grupo
                },
            changeListener),
        _produtosEntityDeletionAdapter = DeletionAdapter(
            database,
            'produto',
            ['id'],
            (ProdutosEntity item) => <String, Object?>{
                  'id': item.id,
                  'descricao': item.descricao,
                  'gtin': item.gtin,
                  'un': item.un,
                  'preco': item.preco,
                  'ncm': item.ncm,
                  'cest': item.cest,
                  'cfop': item.cfop,
                  'cst_icms': item.cstIcms,
                  'origem': item.origem,
                  'cst_pis': item.cstPis,
                  'cst_cofins': item.cstCofins,
                  'ibpt_federal': item.ibptFederal,
                  'ibpt_estadual': item.ibptEstadual,
                  'ibpt_municipal': item.ibptMunicipal,
                  'aliq_icms': item.aliqIcms,
                  'aliq_pis': item.aliqPis,
                  'aliq_cofins': item.aliqCofins,
                  'img': item.img,
                  'grupo': item.grupo
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProdutosEntity> _produtosEntityInsertionAdapter;

  final UpdateAdapter<ProdutosEntity> _produtosEntityUpdateAdapter;

  final DeletionAdapter<ProdutosEntity> _produtosEntityDeletionAdapter;

  @override
  Future<List<ProdutosEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT *   FROM produto   ORDER BY id',
        mapper: (Map<String, Object?> row) => ProdutosEntity(
            id: row['id'] as int?,
            descricao: row['descricao'] as String?,
            gtin: row['gtin'] as String?,
            un: row['un'] as String?,
            preco: row['preco'] as double?,
            ncm: row['ncm'] as String?,
            cest: row['cest'] as String?,
            cfop: row['cfop'] as String?,
            cstIcms: row['cst_icms'] as String?,
            origem: row['origem'] as String?,
            cstPis: row['cst_pis'] as String?,
            cstCofins: row['cst_cofins'] as String?,
            ibptFederal: row['ibpt_federal'] as double?,
            ibptEstadual: row['ibpt_estadual'] as double?,
            ibptMunicipal: row['ibpt_municipal'] as double?,
            aliqIcms: row['aliq_icms'] as double?,
            aliqPis: row['aliq_pis'] as double?,
            aliqCofins: row['aliq_cofins'] as double?,
            img: row['img'] as String?,
            grupo: row['grupo'] as String?));
  }

  @override
  Future<List<ProdutosEntity>> findAllByGrupo(String grupo) async {
    return _queryAdapter.queryList(
        'SELECT *   FROM produto   WHERE grupo = ?1   ORDER BY id',
        mapper: (Map<String, Object?> row) => ProdutosEntity(
            id: row['id'] as int?,
            descricao: row['descricao'] as String?,
            gtin: row['gtin'] as String?,
            un: row['un'] as String?,
            preco: row['preco'] as double?,
            ncm: row['ncm'] as String?,
            cest: row['cest'] as String?,
            cfop: row['cfop'] as String?,
            cstIcms: row['cst_icms'] as String?,
            origem: row['origem'] as String?,
            cstPis: row['cst_pis'] as String?,
            cstCofins: row['cst_cofins'] as String?,
            ibptFederal: row['ibpt_federal'] as double?,
            ibptEstadual: row['ibpt_estadual'] as double?,
            ibptMunicipal: row['ibpt_municipal'] as double?,
            aliqIcms: row['aliq_icms'] as double?,
            aliqPis: row['aliq_pis'] as double?,
            aliqCofins: row['aliq_cofins'] as double?,
            img: row['img'] as String?,
            grupo: row['grupo'] as String?),
        arguments: [grupo]);
  }

  @override
  Stream<List<ProdutosEntity>> findAllStream() {
    return _queryAdapter.queryListStream(
        'SELECT *   FROM produto   ORDER BY id',
        mapper: (Map<String, Object?> row) => ProdutosEntity(
            id: row['id'] as int?,
            descricao: row['descricao'] as String?,
            gtin: row['gtin'] as String?,
            un: row['un'] as String?,
            preco: row['preco'] as double?,
            ncm: row['ncm'] as String?,
            cest: row['cest'] as String?,
            cfop: row['cfop'] as String?,
            cstIcms: row['cst_icms'] as String?,
            origem: row['origem'] as String?,
            cstPis: row['cst_pis'] as String?,
            cstCofins: row['cst_cofins'] as String?,
            ibptFederal: row['ibpt_federal'] as double?,
            ibptEstadual: row['ibpt_estadual'] as double?,
            ibptMunicipal: row['ibpt_municipal'] as double?,
            aliqIcms: row['aliq_icms'] as double?,
            aliqPis: row['aliq_pis'] as double?,
            aliqCofins: row['aliq_cofins'] as double?,
            img: row['img'] as String?,
            grupo: row['grupo'] as String?),
        queryableName: 'produto',
        isView: false);
  }

  @override
  Future<List<ProdutosEntity>> findByName(String descricao) async {
    return _queryAdapter.queryList(
        'SELECT *   FROM produto   WHERE descricao like \'%\' || ?1 || \'%\'   ORDER BY id',
        mapper: (Map<String, Object?> row) => ProdutosEntity(id: row['id'] as int?, descricao: row['descricao'] as String?, gtin: row['gtin'] as String?, un: row['un'] as String?, preco: row['preco'] as double?, ncm: row['ncm'] as String?, cest: row['cest'] as String?, cfop: row['cfop'] as String?, cstIcms: row['cst_icms'] as String?, origem: row['origem'] as String?, cstPis: row['cst_pis'] as String?, cstCofins: row['cst_cofins'] as String?, ibptFederal: row['ibpt_federal'] as double?, ibptEstadual: row['ibpt_estadual'] as double?, ibptMunicipal: row['ibpt_municipal'] as double?, aliqIcms: row['aliq_icms'] as double?, aliqPis: row['aliq_pis'] as double?, aliqCofins: row['aliq_cofins'] as double?, img: row['img'] as String?, grupo: row['grupo'] as String?),
        arguments: [descricao]);
  }

  @override
  Future<List<ProdutosEntity>> findByText(
      String descricao, String grupo) async {
    return _queryAdapter.queryList(
        'SELECT *   FROM produto   WHERE ( descricao || \'-\' || gtin ) like \'%\' || ?1 || \'%\'   AND grupo like \'%\' || ?2 || \'%\'    ORDER BY id',
        mapper: (Map<String, Object?> row) => ProdutosEntity(id: row['id'] as int?, descricao: row['descricao'] as String?, gtin: row['gtin'] as String?, un: row['un'] as String?, preco: row['preco'] as double?, ncm: row['ncm'] as String?, cest: row['cest'] as String?, cfop: row['cfop'] as String?, cstIcms: row['cst_icms'] as String?, origem: row['origem'] as String?, cstPis: row['cst_pis'] as String?, cstCofins: row['cst_cofins'] as String?, ibptFederal: row['ibpt_federal'] as double?, ibptEstadual: row['ibpt_estadual'] as double?, ibptMunicipal: row['ibpt_municipal'] as double?, aliqIcms: row['aliq_icms'] as double?, aliqPis: row['aliq_pis'] as double?, aliqCofins: row['aliq_cofins'] as double?, img: row['img'] as String?, grupo: row['grupo'] as String?),
        arguments: [descricao, grupo]);
  }

  @override
  Stream<List<ProdutosEntity>> findByNameStream(String descricao) {
    return _queryAdapter.queryListStream(
        'SELECT *   FROM produto   WHERE descricao like \'%\' || ?1 || \'%\'   ORDER BY id',
        mapper: (Map<String, Object?> row) => ProdutosEntity(
            id: row['id'] as int?,
            descricao: row['descricao'] as String?,
            gtin: row['gtin'] as String?,
            un: row['un'] as String?,
            preco: row['preco'] as double?,
            ncm: row['ncm'] as String?,
            cest: row['cest'] as String?,
            cfop: row['cfop'] as String?,
            cstIcms: row['cst_icms'] as String?,
            origem: row['origem'] as String?,
            cstPis: row['cst_pis'] as String?,
            cstCofins: row['cst_cofins'] as String?,
            ibptFederal: row['ibpt_federal'] as double?,
            ibptEstadual: row['ibpt_estadual'] as double?,
            ibptMunicipal: row['ibpt_municipal'] as double?,
            aliqIcms: row['aliq_icms'] as double?,
            aliqPis: row['aliq_pis'] as double?,
            aliqCofins: row['aliq_cofins'] as double?,
            img: row['img'] as String?,
            grupo: row['grupo'] as String?),
        arguments: [descricao],
        queryableName: 'produto',
        isView: false);
  }

  @override
  Future<ProdutosEntity?> findById(int id) async {
    return _queryAdapter.query(
        'SELECT *   FROM produto   WHERE id = ?1   ORDER BY id',
        mapper: (Map<String, Object?> row) => ProdutosEntity(
            id: row['id'] as int?,
            descricao: row['descricao'] as String?,
            gtin: row['gtin'] as String?,
            un: row['un'] as String?,
            preco: row['preco'] as double?,
            ncm: row['ncm'] as String?,
            cest: row['cest'] as String?,
            cfop: row['cfop'] as String?,
            cstIcms: row['cst_icms'] as String?,
            origem: row['origem'] as String?,
            cstPis: row['cst_pis'] as String?,
            cstCofins: row['cst_cofins'] as String?,
            ibptFederal: row['ibpt_federal'] as double?,
            ibptEstadual: row['ibpt_estadual'] as double?,
            ibptMunicipal: row['ibpt_municipal'] as double?,
            aliqIcms: row['aliq_icms'] as double?,
            aliqPis: row['aliq_pis'] as double?,
            aliqCofins: row['aliq_cofins'] as double?,
            img: row['img'] as String?,
            grupo: row['grupo'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> deleteDataById(int id) async {
    await _queryAdapter.queryNoReturn('DELETE    FROM produto    WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertData(ProdutosEntity entityInstance) async {
    await _produtosEntityInsertionAdapter.insert(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertListData(List<ProdutosEntity> entityInstance) async {
    await _produtosEntityInsertionAdapter.insertList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateData(ProdutosEntity entityInstance) async {
    await _produtosEntityUpdateAdapter.update(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateListData(List<ProdutosEntity> entityInstance) async {
    await _produtosEntityUpdateAdapter.updateList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteData(ProdutosEntity entityInstance) async {
    await _produtosEntityDeletionAdapter.delete(entityInstance);
  }
}

class _$EmpresaDAO extends EmpresaDAO {
  _$EmpresaDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _empresaEntityInsertionAdapter = InsertionAdapter(
            database,
            'empresa',
            (EmpresaEntity item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'cnpj': item.cnpj,
                  'ie': item.ie,
                  'logradouro': item.logradouro,
                  'numero': item.numero,
                  'bairro': item.bairro,
                  'cidade': item.cidade,
                  'uf': item.uf,
                  'ibge': item.ibge,
                  'cep': item.cep,
                  'crt': item.crt,
                  'forma_emissao': item.formaEmissao,
                  'serie': item.serie,
                  'ultimo_doc': item.ultimoDoc
                },
            changeListener),
        _empresaEntityUpdateAdapter = UpdateAdapter(
            database,
            'empresa',
            ['id'],
            (EmpresaEntity item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'cnpj': item.cnpj,
                  'ie': item.ie,
                  'logradouro': item.logradouro,
                  'numero': item.numero,
                  'bairro': item.bairro,
                  'cidade': item.cidade,
                  'uf': item.uf,
                  'ibge': item.ibge,
                  'cep': item.cep,
                  'crt': item.crt,
                  'forma_emissao': item.formaEmissao,
                  'serie': item.serie,
                  'ultimo_doc': item.ultimoDoc
                },
            changeListener),
        _empresaEntityDeletionAdapter = DeletionAdapter(
            database,
            'empresa',
            ['id'],
            (EmpresaEntity item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'cnpj': item.cnpj,
                  'ie': item.ie,
                  'logradouro': item.logradouro,
                  'numero': item.numero,
                  'bairro': item.bairro,
                  'cidade': item.cidade,
                  'uf': item.uf,
                  'ibge': item.ibge,
                  'cep': item.cep,
                  'crt': item.crt,
                  'forma_emissao': item.formaEmissao,
                  'serie': item.serie,
                  'ultimo_doc': item.ultimoDoc
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<EmpresaEntity> _empresaEntityInsertionAdapter;

  final UpdateAdapter<EmpresaEntity> _empresaEntityUpdateAdapter;

  final DeletionAdapter<EmpresaEntity> _empresaEntityDeletionAdapter;

  @override
  Future<List<EmpresaEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT *   FROM empresa   ORDER BY id',
        mapper: (Map<String, Object?> row) => EmpresaEntity(
            id: row['id'] as int?,
            nome: row['nome'] as String?,
            cnpj: row['cnpj'] as String?,
            ie: row['ie'] as String?,
            logradouro: row['logradouro'] as String?,
            numero: row['numero'] as String?,
            bairro: row['bairro'] as String?,
            cidade: row['cidade'] as String?,
            uf: row['uf'] as String?,
            ibge: row['ibge'] as String?,
            cep: row['cep'] as String?,
            crt: row['crt'] as int?,
            formaEmissao: row['forma_emissao'] as int?,
            serie: row['serie'] as String?,
            ultimoDoc: row['ultimo_doc'] as int?));
  }

  @override
  Stream<List<EmpresaEntity>> findAllStream() {
    return _queryAdapter.queryListStream(
        'SELECT *   FROM empresa   ORDER BY id',
        mapper: (Map<String, Object?> row) => EmpresaEntity(
            id: row['id'] as int?,
            nome: row['nome'] as String?,
            cnpj: row['cnpj'] as String?,
            ie: row['ie'] as String?,
            logradouro: row['logradouro'] as String?,
            numero: row['numero'] as String?,
            bairro: row['bairro'] as String?,
            cidade: row['cidade'] as String?,
            uf: row['uf'] as String?,
            ibge: row['ibge'] as String?,
            cep: row['cep'] as String?,
            crt: row['crt'] as int?,
            formaEmissao: row['forma_emissao'] as int?,
            serie: row['serie'] as String?,
            ultimoDoc: row['ultimo_doc'] as int?),
        queryableName: 'empresa',
        isView: false);
  }

  @override
  Future<List<EmpresaEntity>> findByName(String nome) async {
    return _queryAdapter.queryList(
        'SELECT *   FROM empresa   WHERE nome like \'%\' || ?1 || \'%\'   ORDER BY id',
        mapper: (Map<String, Object?> row) => EmpresaEntity(id: row['id'] as int?, nome: row['nome'] as String?, cnpj: row['cnpj'] as String?, ie: row['ie'] as String?, logradouro: row['logradouro'] as String?, numero: row['numero'] as String?, bairro: row['bairro'] as String?, cidade: row['cidade'] as String?, uf: row['uf'] as String?, ibge: row['ibge'] as String?, cep: row['cep'] as String?, crt: row['crt'] as int?, formaEmissao: row['forma_emissao'] as int?, serie: row['serie'] as String?, ultimoDoc: row['ultimo_doc'] as int?),
        arguments: [nome]);
  }

  @override
  Future<List<EmpresaEntity>> findByText(String nome) async {
    return _queryAdapter.queryList(
        'SELECT *   FROM empresa   WHERE ( nome || cnpj || ie ) like \'%\' || ?1 || \'%\'   ORDER BY id',
        mapper: (Map<String, Object?> row) => EmpresaEntity(id: row['id'] as int?, nome: row['nome'] as String?, cnpj: row['cnpj'] as String?, ie: row['ie'] as String?, logradouro: row['logradouro'] as String?, numero: row['numero'] as String?, bairro: row['bairro'] as String?, cidade: row['cidade'] as String?, uf: row['uf'] as String?, ibge: row['ibge'] as String?, cep: row['cep'] as String?, crt: row['crt'] as int?, formaEmissao: row['forma_emissao'] as int?, serie: row['serie'] as String?, ultimoDoc: row['ultimo_doc'] as int?),
        arguments: [nome]);
  }

  @override
  Stream<List<EmpresaEntity>> findByNameStream(String nome) {
    return _queryAdapter.queryListStream(
        'SELECT *   FROM empresa   WHERE nome like \'%\' || ?1 || \'%\'   ORDER BY id',
        mapper: (Map<String, Object?> row) => EmpresaEntity(
            id: row['id'] as int?,
            nome: row['nome'] as String?,
            cnpj: row['cnpj'] as String?,
            ie: row['ie'] as String?,
            logradouro: row['logradouro'] as String?,
            numero: row['numero'] as String?,
            bairro: row['bairro'] as String?,
            cidade: row['cidade'] as String?,
            uf: row['uf'] as String?,
            ibge: row['ibge'] as String?,
            cep: row['cep'] as String?,
            crt: row['crt'] as int?,
            formaEmissao: row['forma_emissao'] as int?,
            serie: row['serie'] as String?,
            ultimoDoc: row['ultimo_doc'] as int?),
        arguments: [nome],
        queryableName: 'empresa',
        isView: false);
  }

  @override
  Future<EmpresaEntity?> findById(int id) async {
    return _queryAdapter.query(
        'SELECT *   FROM empresa   WHERE id = ?1   ORDER BY id',
        mapper: (Map<String, Object?> row) => EmpresaEntity(
            id: row['id'] as int?,
            nome: row['nome'] as String?,
            cnpj: row['cnpj'] as String?,
            ie: row['ie'] as String?,
            logradouro: row['logradouro'] as String?,
            numero: row['numero'] as String?,
            bairro: row['bairro'] as String?,
            cidade: row['cidade'] as String?,
            uf: row['uf'] as String?,
            ibge: row['ibge'] as String?,
            cep: row['cep'] as String?,
            crt: row['crt'] as int?,
            formaEmissao: row['forma_emissao'] as int?,
            serie: row['serie'] as String?,
            ultimoDoc: row['ultimo_doc'] as int?),
        arguments: [id]);
  }

  @override
  Future<void> deleteDataById(int id) async {
    await _queryAdapter.queryNoReturn('DELETE    FROM empresa    WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertData(EmpresaEntity entityInstance) async {
    await _empresaEntityInsertionAdapter.insert(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertListData(List<EmpresaEntity> entityInstance) async {
    await _empresaEntityInsertionAdapter.insertList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateData(EmpresaEntity entityInstance) async {
    await _empresaEntityUpdateAdapter.update(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateListData(List<EmpresaEntity> entityInstance) async {
    await _empresaEntityUpdateAdapter.updateList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteData(EmpresaEntity entityInstance) async {
    await _empresaEntityDeletionAdapter.delete(entityInstance);
  }
}

class _$CaixaDAO extends CaixaDAO {
  _$CaixaDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _caixaEntityInsertionAdapter = InsertionAdapter(
            database,
            'caixa',
            (CaixaEntity item) => <String, Object?>{
                  'id': item.id,
                  'terminal': item.terminal,
                  'abertura': item.abertura,
                  'valor_abertura': item.valorAbertura,
                  'id_usuario': item.idUsuario,
                  'fechamento': item.fechamento,
                  'valor_fechamento': item.valorFechamento,
                  'diferenca': item.diferenca
                }),
        _caixaEntityUpdateAdapter = UpdateAdapter(
            database,
            'caixa',
            ['id'],
            (CaixaEntity item) => <String, Object?>{
                  'id': item.id,
                  'terminal': item.terminal,
                  'abertura': item.abertura,
                  'valor_abertura': item.valorAbertura,
                  'id_usuario': item.idUsuario,
                  'fechamento': item.fechamento,
                  'valor_fechamento': item.valorFechamento,
                  'diferenca': item.diferenca
                }),
        _caixaEntityDeletionAdapter = DeletionAdapter(
            database,
            'caixa',
            ['id'],
            (CaixaEntity item) => <String, Object?>{
                  'id': item.id,
                  'terminal': item.terminal,
                  'abertura': item.abertura,
                  'valor_abertura': item.valorAbertura,
                  'id_usuario': item.idUsuario,
                  'fechamento': item.fechamento,
                  'valor_fechamento': item.valorFechamento,
                  'diferenca': item.diferenca
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CaixaEntity> _caixaEntityInsertionAdapter;

  final UpdateAdapter<CaixaEntity> _caixaEntityUpdateAdapter;

  final DeletionAdapter<CaixaEntity> _caixaEntityDeletionAdapter;

  @override
  Future<CaixaEntity?> obterRegistroDeCaixa(int id, String data) async {
    return _queryAdapter.query(
        'select *       from caixa      where caixa.id = ?1        and date(abertura) = date(?2)        and caixa.fechamento is null',
        mapper: (Map<String, Object?> row) => CaixaEntity(id: row['id'] as int?, terminal: row['terminal'] as String?, abertura: row['abertura'] as String?, valorAbertura: row['valor_abertura'] as double?, idUsuario: row['id_usuario'] as int?, fechamento: row['fechamento'] as String?, valorFechamento: row['valor_fechamento'] as double?, diferenca: row['diferenca'] as double?),
        arguments: [id, data]);
  }

  @override
  Future<List<CaixaEntity>?> obterRegistroDeCaixaDia(String data) async {
    return _queryAdapter.queryList(
        'select *       from caixa      where date(abertura) = date(?1)',
        mapper: (Map<String, Object?> row) => CaixaEntity(
            id: row['id'] as int?,
            terminal: row['terminal'] as String?,
            abertura: row['abertura'] as String?,
            valorAbertura: row['valor_abertura'] as double?,
            idUsuario: row['id_usuario'] as int?,
            fechamento: row['fechamento'] as String?,
            valorFechamento: row['valor_fechamento'] as double?,
            diferenca: row['diferenca'] as double?),
        arguments: [data]);
  }

  @override
  Future<void> insertData(CaixaEntity entityInstance) async {
    await _caixaEntityInsertionAdapter.insert(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertListData(List<CaixaEntity> entityInstance) async {
    await _caixaEntityInsertionAdapter.insertList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateData(CaixaEntity entityInstance) async {
    await _caixaEntityUpdateAdapter.update(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateListData(List<CaixaEntity> entityInstance) async {
    await _caixaEntityUpdateAdapter.updateList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteData(CaixaEntity entityInstance) async {
    await _caixaEntityDeletionAdapter.delete(entityInstance);
  }
}

class _$VendaDAO extends VendaDAO {
  _$VendaDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _vendaEntityInsertionAdapter = InsertionAdapter(
            database,
            'venda',
            (VendaEntity item) => <String, Object?>{
                  'id': item.id,
                  'cuf': item.cuf,
                  'cnf': item.cnf,
                  'natope': item.natope,
                  'modelo': item.modelo,
                  'serie': item.serie,
                  'nnf': item.nnf,
                  'dhemi': item.dhemi,
                  'dhsaient': item.dhsaient,
                  'tpnf': item.tpnf,
                  'iddest': item.iddest,
                  'cmunfg': item.cmunfg,
                  'tpimp': item.tpimp,
                  'tpemis': item.tpemis,
                  'cdv': item.cdv,
                  'tpamb': item.tpamb,
                  'finnfe': item.finnfe,
                  'indfinal': item.indfinal,
                  'indpres': item.indpres,
                  'procemi': item.procemi,
                  'verproc': item.verproc,
                  'dhcont': item.dhcont,
                  'xjust': item.xjust,
                  'cnpjemi': item.cnpjemi,
                  'xnomeemi': item.xnomeemi,
                  'xfant': item.xfant,
                  'xlgremi': item.xlgremi,
                  'nroemi': item.nroemi,
                  'xcplemi': item.xcplemi,
                  'xbairroemi': item.xbairroemi,
                  'cmunemi': item.cmunemi,
                  'xmunemi': item.xmunemi,
                  'ufemi': item.ufemi,
                  'cepemi': item.cepemi,
                  'cpaisemi': item.cpaisemi,
                  'xpaisemi': item.xpaisemi,
                  'foneemi': item.foneemi,
                  'ieemi': item.ieemi,
                  'iest': item.iest,
                  'imemi': item.imemi,
                  'cnae': item.cnae,
                  'crt': item.crt,
                  'cnpjdest': item.cnpjdest,
                  'cpfdest': item.cpfdest,
                  'xlgrdest': item.xlgrdest,
                  'nrodest': item.nrodest,
                  'xcpldest': item.xcpldest,
                  'xbairrodest': item.xbairrodest,
                  'cmundest': item.cmundest,
                  'xmundest': item.xmundest,
                  'ufdest': item.ufdest,
                  'cepdest': item.cepdest,
                  'cpaisdest': item.cpaisdest,
                  'xpaisdest': item.xpaisdest,
                  'fonedest': item.fonedest,
                  'indiedest': item.indiedest,
                  'iedest': item.iedest,
                  'isuf': item.isuf,
                  'imdest': item.imdest,
                  'email': item.email,
                  'vbc': item.vbc,
                  'vicms': item.vicms,
                  'vbcst': item.vbcst,
                  'vst': item.vst,
                  'vprod': item.vprod,
                  'vfrete': item.vfrete,
                  'vseg': item.vseg,
                  'vdesc': item.vdesc,
                  'vii': item.vii,
                  'vipi': item.vipi,
                  'vpis': item.vpis,
                  'vcofins': item.vcofins,
                  'voutro': item.voutro,
                  'vnf': item.vnf,
                  'vtottrib': item.vtottrib,
                  'vicmsdeson': item.vicmsdeson,
                  'vicmsufdestopc': item.vicmsufdestopc,
                  'vicmsufremet': item.vicmsufremet,
                  'vfcpufdestopc': item.vfcpufdestopc,
                  'vfcp': item.vfcp,
                  'vfcpst': item.vfcpst,
                  'vfcpstret': item.vfcpstret,
                  'vipidevol': item.vipidevol,
                  'modfrete': item.modfrete,
                  'cnpjtransp': item.cnpjtransp,
                  'cpftransp': item.cpftransp,
                  'xnometransp': item.xnometransp,
                  'ietransp': item.ietransp,
                  'xender': item.xender,
                  'xmuntransp': item.xmuntransp,
                  'uftransp': item.uftransp,
                  'infadfisco': item.infadfisco,
                  'infcpl': item.infcpl,
                  'nfat': item.nfat,
                  'vorig': item.vorig,
                  'vdescfatura': item.vdescfatura,
                  'vliq': item.vliq,
                  'versao': item.versao,
                  'chavenf': item.chavenf,
                  'statusnfe': item.statusnfe
                }),
        _vendaEntityUpdateAdapter = UpdateAdapter(
            database,
            'venda',
            ['id'],
            (VendaEntity item) => <String, Object?>{
                  'id': item.id,
                  'cuf': item.cuf,
                  'cnf': item.cnf,
                  'natope': item.natope,
                  'modelo': item.modelo,
                  'serie': item.serie,
                  'nnf': item.nnf,
                  'dhemi': item.dhemi,
                  'dhsaient': item.dhsaient,
                  'tpnf': item.tpnf,
                  'iddest': item.iddest,
                  'cmunfg': item.cmunfg,
                  'tpimp': item.tpimp,
                  'tpemis': item.tpemis,
                  'cdv': item.cdv,
                  'tpamb': item.tpamb,
                  'finnfe': item.finnfe,
                  'indfinal': item.indfinal,
                  'indpres': item.indpres,
                  'procemi': item.procemi,
                  'verproc': item.verproc,
                  'dhcont': item.dhcont,
                  'xjust': item.xjust,
                  'cnpjemi': item.cnpjemi,
                  'xnomeemi': item.xnomeemi,
                  'xfant': item.xfant,
                  'xlgremi': item.xlgremi,
                  'nroemi': item.nroemi,
                  'xcplemi': item.xcplemi,
                  'xbairroemi': item.xbairroemi,
                  'cmunemi': item.cmunemi,
                  'xmunemi': item.xmunemi,
                  'ufemi': item.ufemi,
                  'cepemi': item.cepemi,
                  'cpaisemi': item.cpaisemi,
                  'xpaisemi': item.xpaisemi,
                  'foneemi': item.foneemi,
                  'ieemi': item.ieemi,
                  'iest': item.iest,
                  'imemi': item.imemi,
                  'cnae': item.cnae,
                  'crt': item.crt,
                  'cnpjdest': item.cnpjdest,
                  'cpfdest': item.cpfdest,
                  'xlgrdest': item.xlgrdest,
                  'nrodest': item.nrodest,
                  'xcpldest': item.xcpldest,
                  'xbairrodest': item.xbairrodest,
                  'cmundest': item.cmundest,
                  'xmundest': item.xmundest,
                  'ufdest': item.ufdest,
                  'cepdest': item.cepdest,
                  'cpaisdest': item.cpaisdest,
                  'xpaisdest': item.xpaisdest,
                  'fonedest': item.fonedest,
                  'indiedest': item.indiedest,
                  'iedest': item.iedest,
                  'isuf': item.isuf,
                  'imdest': item.imdest,
                  'email': item.email,
                  'vbc': item.vbc,
                  'vicms': item.vicms,
                  'vbcst': item.vbcst,
                  'vst': item.vst,
                  'vprod': item.vprod,
                  'vfrete': item.vfrete,
                  'vseg': item.vseg,
                  'vdesc': item.vdesc,
                  'vii': item.vii,
                  'vipi': item.vipi,
                  'vpis': item.vpis,
                  'vcofins': item.vcofins,
                  'voutro': item.voutro,
                  'vnf': item.vnf,
                  'vtottrib': item.vtottrib,
                  'vicmsdeson': item.vicmsdeson,
                  'vicmsufdestopc': item.vicmsufdestopc,
                  'vicmsufremet': item.vicmsufremet,
                  'vfcpufdestopc': item.vfcpufdestopc,
                  'vfcp': item.vfcp,
                  'vfcpst': item.vfcpst,
                  'vfcpstret': item.vfcpstret,
                  'vipidevol': item.vipidevol,
                  'modfrete': item.modfrete,
                  'cnpjtransp': item.cnpjtransp,
                  'cpftransp': item.cpftransp,
                  'xnometransp': item.xnometransp,
                  'ietransp': item.ietransp,
                  'xender': item.xender,
                  'xmuntransp': item.xmuntransp,
                  'uftransp': item.uftransp,
                  'infadfisco': item.infadfisco,
                  'infcpl': item.infcpl,
                  'nfat': item.nfat,
                  'vorig': item.vorig,
                  'vdescfatura': item.vdescfatura,
                  'vliq': item.vliq,
                  'versao': item.versao,
                  'chavenf': item.chavenf,
                  'statusnfe': item.statusnfe
                }),
        _vendaEntityDeletionAdapter = DeletionAdapter(
            database,
            'venda',
            ['id'],
            (VendaEntity item) => <String, Object?>{
                  'id': item.id,
                  'cuf': item.cuf,
                  'cnf': item.cnf,
                  'natope': item.natope,
                  'modelo': item.modelo,
                  'serie': item.serie,
                  'nnf': item.nnf,
                  'dhemi': item.dhemi,
                  'dhsaient': item.dhsaient,
                  'tpnf': item.tpnf,
                  'iddest': item.iddest,
                  'cmunfg': item.cmunfg,
                  'tpimp': item.tpimp,
                  'tpemis': item.tpemis,
                  'cdv': item.cdv,
                  'tpamb': item.tpamb,
                  'finnfe': item.finnfe,
                  'indfinal': item.indfinal,
                  'indpres': item.indpres,
                  'procemi': item.procemi,
                  'verproc': item.verproc,
                  'dhcont': item.dhcont,
                  'xjust': item.xjust,
                  'cnpjemi': item.cnpjemi,
                  'xnomeemi': item.xnomeemi,
                  'xfant': item.xfant,
                  'xlgremi': item.xlgremi,
                  'nroemi': item.nroemi,
                  'xcplemi': item.xcplemi,
                  'xbairroemi': item.xbairroemi,
                  'cmunemi': item.cmunemi,
                  'xmunemi': item.xmunemi,
                  'ufemi': item.ufemi,
                  'cepemi': item.cepemi,
                  'cpaisemi': item.cpaisemi,
                  'xpaisemi': item.xpaisemi,
                  'foneemi': item.foneemi,
                  'ieemi': item.ieemi,
                  'iest': item.iest,
                  'imemi': item.imemi,
                  'cnae': item.cnae,
                  'crt': item.crt,
                  'cnpjdest': item.cnpjdest,
                  'cpfdest': item.cpfdest,
                  'xlgrdest': item.xlgrdest,
                  'nrodest': item.nrodest,
                  'xcpldest': item.xcpldest,
                  'xbairrodest': item.xbairrodest,
                  'cmundest': item.cmundest,
                  'xmundest': item.xmundest,
                  'ufdest': item.ufdest,
                  'cepdest': item.cepdest,
                  'cpaisdest': item.cpaisdest,
                  'xpaisdest': item.xpaisdest,
                  'fonedest': item.fonedest,
                  'indiedest': item.indiedest,
                  'iedest': item.iedest,
                  'isuf': item.isuf,
                  'imdest': item.imdest,
                  'email': item.email,
                  'vbc': item.vbc,
                  'vicms': item.vicms,
                  'vbcst': item.vbcst,
                  'vst': item.vst,
                  'vprod': item.vprod,
                  'vfrete': item.vfrete,
                  'vseg': item.vseg,
                  'vdesc': item.vdesc,
                  'vii': item.vii,
                  'vipi': item.vipi,
                  'vpis': item.vpis,
                  'vcofins': item.vcofins,
                  'voutro': item.voutro,
                  'vnf': item.vnf,
                  'vtottrib': item.vtottrib,
                  'vicmsdeson': item.vicmsdeson,
                  'vicmsufdestopc': item.vicmsufdestopc,
                  'vicmsufremet': item.vicmsufremet,
                  'vfcpufdestopc': item.vfcpufdestopc,
                  'vfcp': item.vfcp,
                  'vfcpst': item.vfcpst,
                  'vfcpstret': item.vfcpstret,
                  'vipidevol': item.vipidevol,
                  'modfrete': item.modfrete,
                  'cnpjtransp': item.cnpjtransp,
                  'cpftransp': item.cpftransp,
                  'xnometransp': item.xnometransp,
                  'ietransp': item.ietransp,
                  'xender': item.xender,
                  'xmuntransp': item.xmuntransp,
                  'uftransp': item.uftransp,
                  'infadfisco': item.infadfisco,
                  'infcpl': item.infcpl,
                  'nfat': item.nfat,
                  'vorig': item.vorig,
                  'vdescfatura': item.vdescfatura,
                  'vliq': item.vliq,
                  'versao': item.versao,
                  'chavenf': item.chavenf,
                  'statusnfe': item.statusnfe
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<VendaEntity> _vendaEntityInsertionAdapter;

  final UpdateAdapter<VendaEntity> _vendaEntityUpdateAdapter;

  final DeletionAdapter<VendaEntity> _vendaEntityDeletionAdapter;

  @override
  Future<VendaEntity?> obterRegistroDeVendaPorId(int id) async {
    return _queryAdapter.query(
        'select *       from venda      where venda.id = ?1',
        mapper: (Map<String, Object?> row) => VendaEntity(
            id: row['id'] as int?,
            cuf: row['cuf'] as int?,
            cnf: row['cnf'] as int?,
            natope: row['natope'] as String?,
            modelo: row['modelo'] as int?,
            serie: row['serie'] as int?,
            nnf: row['nnf'] as int?,
            dhemi: row['dhemi'] as String?,
            dhsaient: row['dhsaient'] as String?,
            tpnf: row['tpnf'] as int?,
            iddest: row['iddest'] as int?,
            cmunfg: row['cmunfg'] as String?,
            tpimp: row['tpimp'] as int?,
            tpemis: row['tpemis'] as int?,
            cdv: row['cdv'] as int?,
            tpamb: row['tpamb'] as int?,
            finnfe: row['finnfe'] as int?,
            indfinal: row['indfinal'] as int?,
            indpres: row['indpres'] as int?,
            procemi: row['procemi'] as int?,
            verproc: row['verproc'] as String?,
            dhcont: row['dhcont'] as String?,
            xjust: row['xjust'] as String?,
            cnpjemi: row['cnpjemi'] as String?,
            xnomeemi: row['xnomeemi'] as String?,
            xfant: row['xfant'] as String?,
            xlgremi: row['xlgremi'] as String?,
            nroemi: row['nroemi'] as String?,
            xcplemi: row['xcplemi'] as String?,
            xbairroemi: row['xbairroemi'] as String?,
            cmunemi: row['cmunemi'] as String?,
            xmunemi: row['xmunemi'] as String?,
            ufemi: row['ufemi'] as String?,
            cepemi: row['cepemi'] as String?,
            cpaisemi: row['cpaisemi'] as String?,
            xpaisemi: row['xpaisemi'] as String?,
            foneemi: row['foneemi'] as String?,
            ieemi: row['ieemi'] as String?,
            iest: row['iest'] as String?,
            imemi: row['imemi'] as String?,
            cnae: row['cnae'] as String?,
            crt: row['crt'] as String?,
            cnpjdest: row['cnpjdest'] as String?,
            cpfdest: row['cpfdest'] as String?,
            xlgrdest: row['xlgrdest'] as String?,
            nrodest: row['nrodest'] as String?,
            xcpldest: row['xcpldest'] as String?,
            xbairrodest: row['xbairrodest'] as String?,
            cmundest: row['cmundest'] as String?,
            xmundest: row['xmundest'] as String?,
            ufdest: row['ufdest'] as String?,
            cepdest: row['cepdest'] as String?,
            cpaisdest: row['cpaisdest'] as String?,
            xpaisdest: row['xpaisdest'] as String?,
            fonedest: row['fonedest'] as String?,
            indiedest: row['indiedest'] as String?,
            iedest: row['iedest'] as String?,
            isuf: row['isuf'] as String?,
            imdest: row['imdest'] as String?,
            email: row['email'] as String?,
            vbc: row['vbc'] as double?,
            vicms: row['vicms'] as double?,
            vbcst: row['vbcst'] as double?,
            vst: row['vst'] as double?,
            vprod: row['vprod'] as double?,
            vfrete: row['vfrete'] as double?,
            vseg: row['vseg'] as double?,
            vdesc: row['vdesc'] as double?,
            vii: row['vii'] as double?,
            vipi: row['vipi'] as double?,
            vpis: row['vpis'] as double?,
            vcofins: row['vcofins'] as double?,
            voutro: row['voutro'] as double?,
            vnf: row['vnf'] as double?,
            vtottrib: row['vtottrib'] as double?,
            vicmsdeson: row['vicmsdeson'] as double?,
            vicmsufdestopc: row['vicmsufdestopc'] as double?,
            vicmsufremet: row['vicmsufremet'] as double?,
            vfcpufdestopc: row['vfcpufdestopc'] as double?,
            vfcp: row['vfcp'] as double?,
            vfcpst: row['vfcpst'] as double?,
            vfcpstret: row['vfcpstret'] as double?,
            vipidevol: row['vipidevol'] as double?,
            modfrete: row['modfrete'] as String?,
            cnpjtransp: row['cnpjtransp'] as String?,
            cpftransp: row['cpftransp'] as String?,
            xnometransp: row['xnometransp'] as String?,
            ietransp: row['ietransp'] as String?,
            xender: row['xender'] as String?,
            xmuntransp: row['xmuntransp'] as String?,
            uftransp: row['uftransp'] as String?,
            infadfisco: row['infadfisco'] as String?,
            infcpl: row['infcpl'] as String?,
            nfat: row['nfat'] as String?,
            vorig: row['vorig'] as double?,
            vdescfatura: row['vdescfatura'] as double?,
            vliq: row['vliq'] as double?,
            versao: row['versao'] as String?,
            chavenf: row['chavenf'] as String?,
            statusnfe: row['statusnfe'] as String?),
        arguments: [id]);
  }

  @override
  Future<VendaEntity?> obterRegistroDeVendaPorData(int id, String data) async {
    return _queryAdapter.query(
        'select *       from venda      where venda.id = ?1        and date(dhemi) = date(?2)',
        mapper: (Map<String, Object?> row) => VendaEntity(id: row['id'] as int?, cuf: row['cuf'] as int?, cnf: row['cnf'] as int?, natope: row['natope'] as String?, modelo: row['modelo'] as int?, serie: row['serie'] as int?, nnf: row['nnf'] as int?, dhemi: row['dhemi'] as String?, dhsaient: row['dhsaient'] as String?, tpnf: row['tpnf'] as int?, iddest: row['iddest'] as int?, cmunfg: row['cmunfg'] as String?, tpimp: row['tpimp'] as int?, tpemis: row['tpemis'] as int?, cdv: row['cdv'] as int?, tpamb: row['tpamb'] as int?, finnfe: row['finnfe'] as int?, indfinal: row['indfinal'] as int?, indpres: row['indpres'] as int?, procemi: row['procemi'] as int?, verproc: row['verproc'] as String?, dhcont: row['dhcont'] as String?, xjust: row['xjust'] as String?, cnpjemi: row['cnpjemi'] as String?, xnomeemi: row['xnomeemi'] as String?, xfant: row['xfant'] as String?, xlgremi: row['xlgremi'] as String?, nroemi: row['nroemi'] as String?, xcplemi: row['xcplemi'] as String?, xbairroemi: row['xbairroemi'] as String?, cmunemi: row['cmunemi'] as String?, xmunemi: row['xmunemi'] as String?, ufemi: row['ufemi'] as String?, cepemi: row['cepemi'] as String?, cpaisemi: row['cpaisemi'] as String?, xpaisemi: row['xpaisemi'] as String?, foneemi: row['foneemi'] as String?, ieemi: row['ieemi'] as String?, iest: row['iest'] as String?, imemi: row['imemi'] as String?, cnae: row['cnae'] as String?, crt: row['crt'] as String?, cnpjdest: row['cnpjdest'] as String?, cpfdest: row['cpfdest'] as String?, xlgrdest: row['xlgrdest'] as String?, nrodest: row['nrodest'] as String?, xcpldest: row['xcpldest'] as String?, xbairrodest: row['xbairrodest'] as String?, cmundest: row['cmundest'] as String?, xmundest: row['xmundest'] as String?, ufdest: row['ufdest'] as String?, cepdest: row['cepdest'] as String?, cpaisdest: row['cpaisdest'] as String?, xpaisdest: row['xpaisdest'] as String?, fonedest: row['fonedest'] as String?, indiedest: row['indiedest'] as String?, iedest: row['iedest'] as String?, isuf: row['isuf'] as String?, imdest: row['imdest'] as String?, email: row['email'] as String?, vbc: row['vbc'] as double?, vicms: row['vicms'] as double?, vbcst: row['vbcst'] as double?, vst: row['vst'] as double?, vprod: row['vprod'] as double?, vfrete: row['vfrete'] as double?, vseg: row['vseg'] as double?, vdesc: row['vdesc'] as double?, vii: row['vii'] as double?, vipi: row['vipi'] as double?, vpis: row['vpis'] as double?, vcofins: row['vcofins'] as double?, voutro: row['voutro'] as double?, vnf: row['vnf'] as double?, vtottrib: row['vtottrib'] as double?, vicmsdeson: row['vicmsdeson'] as double?, vicmsufdestopc: row['vicmsufdestopc'] as double?, vicmsufremet: row['vicmsufremet'] as double?, vfcpufdestopc: row['vfcpufdestopc'] as double?, vfcp: row['vfcp'] as double?, vfcpst: row['vfcpst'] as double?, vfcpstret: row['vfcpstret'] as double?, vipidevol: row['vipidevol'] as double?, modfrete: row['modfrete'] as String?, cnpjtransp: row['cnpjtransp'] as String?, cpftransp: row['cpftransp'] as String?, xnometransp: row['xnometransp'] as String?, ietransp: row['ietransp'] as String?, xender: row['xender'] as String?, xmuntransp: row['xmuntransp'] as String?, uftransp: row['uftransp'] as String?, infadfisco: row['infadfisco'] as String?, infcpl: row['infcpl'] as String?, nfat: row['nfat'] as String?, vorig: row['vorig'] as double?, vdescfatura: row['vdescfatura'] as double?, vliq: row['vliq'] as double?, versao: row['versao'] as String?, chavenf: row['chavenf'] as String?, statusnfe: row['statusnfe'] as String?),
        arguments: [id, data]);
  }

  @override
  Future<List<VendaEntity>?> obterRegistroDeVendaDia(String data) async {
    return _queryAdapter.queryList(
        'select *       from venda      where date(dhemi) = date(?1)',
        mapper: (Map<String, Object?> row) => VendaEntity(
            id: row['id'] as int?,
            cuf: row['cuf'] as int?,
            cnf: row['cnf'] as int?,
            natope: row['natope'] as String?,
            modelo: row['modelo'] as int?,
            serie: row['serie'] as int?,
            nnf: row['nnf'] as int?,
            dhemi: row['dhemi'] as String?,
            dhsaient: row['dhsaient'] as String?,
            tpnf: row['tpnf'] as int?,
            iddest: row['iddest'] as int?,
            cmunfg: row['cmunfg'] as String?,
            tpimp: row['tpimp'] as int?,
            tpemis: row['tpemis'] as int?,
            cdv: row['cdv'] as int?,
            tpamb: row['tpamb'] as int?,
            finnfe: row['finnfe'] as int?,
            indfinal: row['indfinal'] as int?,
            indpres: row['indpres'] as int?,
            procemi: row['procemi'] as int?,
            verproc: row['verproc'] as String?,
            dhcont: row['dhcont'] as String?,
            xjust: row['xjust'] as String?,
            cnpjemi: row['cnpjemi'] as String?,
            xnomeemi: row['xnomeemi'] as String?,
            xfant: row['xfant'] as String?,
            xlgremi: row['xlgremi'] as String?,
            nroemi: row['nroemi'] as String?,
            xcplemi: row['xcplemi'] as String?,
            xbairroemi: row['xbairroemi'] as String?,
            cmunemi: row['cmunemi'] as String?,
            xmunemi: row['xmunemi'] as String?,
            ufemi: row['ufemi'] as String?,
            cepemi: row['cepemi'] as String?,
            cpaisemi: row['cpaisemi'] as String?,
            xpaisemi: row['xpaisemi'] as String?,
            foneemi: row['foneemi'] as String?,
            ieemi: row['ieemi'] as String?,
            iest: row['iest'] as String?,
            imemi: row['imemi'] as String?,
            cnae: row['cnae'] as String?,
            crt: row['crt'] as String?,
            cnpjdest: row['cnpjdest'] as String?,
            cpfdest: row['cpfdest'] as String?,
            xlgrdest: row['xlgrdest'] as String?,
            nrodest: row['nrodest'] as String?,
            xcpldest: row['xcpldest'] as String?,
            xbairrodest: row['xbairrodest'] as String?,
            cmundest: row['cmundest'] as String?,
            xmundest: row['xmundest'] as String?,
            ufdest: row['ufdest'] as String?,
            cepdest: row['cepdest'] as String?,
            cpaisdest: row['cpaisdest'] as String?,
            xpaisdest: row['xpaisdest'] as String?,
            fonedest: row['fonedest'] as String?,
            indiedest: row['indiedest'] as String?,
            iedest: row['iedest'] as String?,
            isuf: row['isuf'] as String?,
            imdest: row['imdest'] as String?,
            email: row['email'] as String?,
            vbc: row['vbc'] as double?,
            vicms: row['vicms'] as double?,
            vbcst: row['vbcst'] as double?,
            vst: row['vst'] as double?,
            vprod: row['vprod'] as double?,
            vfrete: row['vfrete'] as double?,
            vseg: row['vseg'] as double?,
            vdesc: row['vdesc'] as double?,
            vii: row['vii'] as double?,
            vipi: row['vipi'] as double?,
            vpis: row['vpis'] as double?,
            vcofins: row['vcofins'] as double?,
            voutro: row['voutro'] as double?,
            vnf: row['vnf'] as double?,
            vtottrib: row['vtottrib'] as double?,
            vicmsdeson: row['vicmsdeson'] as double?,
            vicmsufdestopc: row['vicmsufdestopc'] as double?,
            vicmsufremet: row['vicmsufremet'] as double?,
            vfcpufdestopc: row['vfcpufdestopc'] as double?,
            vfcp: row['vfcp'] as double?,
            vfcpst: row['vfcpst'] as double?,
            vfcpstret: row['vfcpstret'] as double?,
            vipidevol: row['vipidevol'] as double?,
            modfrete: row['modfrete'] as String?,
            cnpjtransp: row['cnpjtransp'] as String?,
            cpftransp: row['cpftransp'] as String?,
            xnometransp: row['xnometransp'] as String?,
            ietransp: row['ietransp'] as String?,
            xender: row['xender'] as String?,
            xmuntransp: row['xmuntransp'] as String?,
            uftransp: row['uftransp'] as String?,
            infadfisco: row['infadfisco'] as String?,
            infcpl: row['infcpl'] as String?,
            nfat: row['nfat'] as String?,
            vorig: row['vorig'] as double?,
            vdescfatura: row['vdescfatura'] as double?,
            vliq: row['vliq'] as double?,
            versao: row['versao'] as String?,
            chavenf: row['chavenf'] as String?,
            statusnfe: row['statusnfe'] as String?),
        arguments: [data]);
  }

  @override
  Future<List<VendaEntity>?> obterRegistroDeVenda() async {
    return _queryAdapter.queryList('select *       from venda',
        mapper: (Map<String, Object?> row) => VendaEntity(
            id: row['id'] as int?,
            cuf: row['cuf'] as int?,
            cnf: row['cnf'] as int?,
            natope: row['natope'] as String?,
            modelo: row['modelo'] as int?,
            serie: row['serie'] as int?,
            nnf: row['nnf'] as int?,
            dhemi: row['dhemi'] as String?,
            dhsaient: row['dhsaient'] as String?,
            tpnf: row['tpnf'] as int?,
            iddest: row['iddest'] as int?,
            cmunfg: row['cmunfg'] as String?,
            tpimp: row['tpimp'] as int?,
            tpemis: row['tpemis'] as int?,
            cdv: row['cdv'] as int?,
            tpamb: row['tpamb'] as int?,
            finnfe: row['finnfe'] as int?,
            indfinal: row['indfinal'] as int?,
            indpres: row['indpres'] as int?,
            procemi: row['procemi'] as int?,
            verproc: row['verproc'] as String?,
            dhcont: row['dhcont'] as String?,
            xjust: row['xjust'] as String?,
            cnpjemi: row['cnpjemi'] as String?,
            xnomeemi: row['xnomeemi'] as String?,
            xfant: row['xfant'] as String?,
            xlgremi: row['xlgremi'] as String?,
            nroemi: row['nroemi'] as String?,
            xcplemi: row['xcplemi'] as String?,
            xbairroemi: row['xbairroemi'] as String?,
            cmunemi: row['cmunemi'] as String?,
            xmunemi: row['xmunemi'] as String?,
            ufemi: row['ufemi'] as String?,
            cepemi: row['cepemi'] as String?,
            cpaisemi: row['cpaisemi'] as String?,
            xpaisemi: row['xpaisemi'] as String?,
            foneemi: row['foneemi'] as String?,
            ieemi: row['ieemi'] as String?,
            iest: row['iest'] as String?,
            imemi: row['imemi'] as String?,
            cnae: row['cnae'] as String?,
            crt: row['crt'] as String?,
            cnpjdest: row['cnpjdest'] as String?,
            cpfdest: row['cpfdest'] as String?,
            xlgrdest: row['xlgrdest'] as String?,
            nrodest: row['nrodest'] as String?,
            xcpldest: row['xcpldest'] as String?,
            xbairrodest: row['xbairrodest'] as String?,
            cmundest: row['cmundest'] as String?,
            xmundest: row['xmundest'] as String?,
            ufdest: row['ufdest'] as String?,
            cepdest: row['cepdest'] as String?,
            cpaisdest: row['cpaisdest'] as String?,
            xpaisdest: row['xpaisdest'] as String?,
            fonedest: row['fonedest'] as String?,
            indiedest: row['indiedest'] as String?,
            iedest: row['iedest'] as String?,
            isuf: row['isuf'] as String?,
            imdest: row['imdest'] as String?,
            email: row['email'] as String?,
            vbc: row['vbc'] as double?,
            vicms: row['vicms'] as double?,
            vbcst: row['vbcst'] as double?,
            vst: row['vst'] as double?,
            vprod: row['vprod'] as double?,
            vfrete: row['vfrete'] as double?,
            vseg: row['vseg'] as double?,
            vdesc: row['vdesc'] as double?,
            vii: row['vii'] as double?,
            vipi: row['vipi'] as double?,
            vpis: row['vpis'] as double?,
            vcofins: row['vcofins'] as double?,
            voutro: row['voutro'] as double?,
            vnf: row['vnf'] as double?,
            vtottrib: row['vtottrib'] as double?,
            vicmsdeson: row['vicmsdeson'] as double?,
            vicmsufdestopc: row['vicmsufdestopc'] as double?,
            vicmsufremet: row['vicmsufremet'] as double?,
            vfcpufdestopc: row['vfcpufdestopc'] as double?,
            vfcp: row['vfcp'] as double?,
            vfcpst: row['vfcpst'] as double?,
            vfcpstret: row['vfcpstret'] as double?,
            vipidevol: row['vipidevol'] as double?,
            modfrete: row['modfrete'] as String?,
            cnpjtransp: row['cnpjtransp'] as String?,
            cpftransp: row['cpftransp'] as String?,
            xnometransp: row['xnometransp'] as String?,
            ietransp: row['ietransp'] as String?,
            xender: row['xender'] as String?,
            xmuntransp: row['xmuntransp'] as String?,
            uftransp: row['uftransp'] as String?,
            infadfisco: row['infadfisco'] as String?,
            infcpl: row['infcpl'] as String?,
            nfat: row['nfat'] as String?,
            vorig: row['vorig'] as double?,
            vdescfatura: row['vdescfatura'] as double?,
            vliq: row['vliq'] as double?,
            versao: row['versao'] as String?,
            chavenf: row['chavenf'] as String?,
            statusnfe: row['statusnfe'] as String?));
  }

  @override
  Future<void> insertData(VendaEntity entityInstance) async {
    await _vendaEntityInsertionAdapter.insert(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertListData(List<VendaEntity> entityInstance) async {
    await _vendaEntityInsertionAdapter.insertList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateData(VendaEntity entityInstance) async {
    await _vendaEntityUpdateAdapter.update(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateListData(List<VendaEntity> entityInstance) async {
    await _vendaEntityUpdateAdapter.updateList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteData(VendaEntity entityInstance) async {
    await _vendaEntityDeletionAdapter.delete(entityInstance);
  }
}

class _$VendaItemDAO extends VendaItemDAO {
  _$VendaItemDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _vendaItemEntityInsertionAdapter = InsertionAdapter(
            database,
            'venda_item',
            (VendaItemEntity item) => <String, Object?>{
                  'id': item.id,
                  'id_venda': item.idVenda,
                  'cprod': item.cprod,
                  'cean': item.cean,
                  'xprod': item.xprod,
                  'ncm': item.ncm,
                  'cest': item.cest,
                  'cfop': item.cfop,
                  'ucom': item.ucom,
                  'qcom': item.qcom,
                  'vuncom': item.vuncom,
                  'vprod': item.vprod,
                  'ceantrib': item.ceantrib,
                  'utrib': item.utrib,
                  'vuntrib': item.vuntrib,
                  'vfrete': item.vfrete,
                  'vseg': item.vseg,
                  'vdesc': item.vdesc,
                  'voutro': item.voutro,
                  'indtot': item.indtot,
                  'orig': item.orig,
                  'csticms': item.csticms,
                  'modbc': item.modbc,
                  'predbc': item.predbc,
                  'vbcicms': item.vbcicms,
                  'picms': item.picms,
                  'vicms': item.vicms,
                  'modbcst': item.modbcst,
                  'pmvast': item.pmvast,
                  'predbcst': item.predbcst,
                  'vbcst': item.vbcst,
                  'picmsst': item.picmsst,
                  'vicmsst': item.vicmsst,
                  'vbcstret': item.vbcstret,
                  'vicmsstret': item.vicmsstret,
                  'vbcstdest': item.vbcstdest,
                  'vicmsstdest': item.vicmsstdest,
                  'pbcop': item.pbcop,
                  'pcredsn': item.pcredsn,
                  'vcredicmssn': item.vcredicmssn,
                  'vicmsdeson': item.vicmsdeson,
                  'vicmsop': item.vicmsop,
                  'pdif': item.pdif,
                  'vicmsdif': item.vicmsdif,
                  'vbcfcp': item.vbcfcp,
                  'pfcp': item.pfcp,
                  'vfcp': item.vfcp,
                  'vbcfcpstret': item.vbcfcpstret,
                  'pfcpstret': item.pfcpstret,
                  'vfcpstret': item.vfcpstret,
                  'pst': item.pst,
                  'cenq': item.cenq,
                  'cstipi': item.cstipi,
                  'vbcipi': item.vbcipi,
                  'pipi': item.pipi,
                  'vipi': item.vipi,
                  'qunid': item.qunid,
                  'vunid': item.vunid,
                  'cstpis': item.cstpis,
                  'vbcpis': item.vbcpis,
                  'ppis': item.ppis,
                  'vpis': item.vpis,
                  'qbcprodpis': item.qbcprodpis,
                  'valiqprodpis': item.valiqprodpis,
                  'cstcofins': item.cstcofins,
                  'vbccofins': item.vbccofins,
                  'pcofins': item.pcofins,
                  'vcofins': item.vcofins,
                  'qbcprodcofins': item.qbcprodcofins,
                  'valiqprodcofins': item.valiqprodcofins
                }),
        _vendaItemEntityUpdateAdapter = UpdateAdapter(
            database,
            'venda_item',
            ['id'],
            (VendaItemEntity item) => <String, Object?>{
                  'id': item.id,
                  'id_venda': item.idVenda,
                  'cprod': item.cprod,
                  'cean': item.cean,
                  'xprod': item.xprod,
                  'ncm': item.ncm,
                  'cest': item.cest,
                  'cfop': item.cfop,
                  'ucom': item.ucom,
                  'qcom': item.qcom,
                  'vuncom': item.vuncom,
                  'vprod': item.vprod,
                  'ceantrib': item.ceantrib,
                  'utrib': item.utrib,
                  'vuntrib': item.vuntrib,
                  'vfrete': item.vfrete,
                  'vseg': item.vseg,
                  'vdesc': item.vdesc,
                  'voutro': item.voutro,
                  'indtot': item.indtot,
                  'orig': item.orig,
                  'csticms': item.csticms,
                  'modbc': item.modbc,
                  'predbc': item.predbc,
                  'vbcicms': item.vbcicms,
                  'picms': item.picms,
                  'vicms': item.vicms,
                  'modbcst': item.modbcst,
                  'pmvast': item.pmvast,
                  'predbcst': item.predbcst,
                  'vbcst': item.vbcst,
                  'picmsst': item.picmsst,
                  'vicmsst': item.vicmsst,
                  'vbcstret': item.vbcstret,
                  'vicmsstret': item.vicmsstret,
                  'vbcstdest': item.vbcstdest,
                  'vicmsstdest': item.vicmsstdest,
                  'pbcop': item.pbcop,
                  'pcredsn': item.pcredsn,
                  'vcredicmssn': item.vcredicmssn,
                  'vicmsdeson': item.vicmsdeson,
                  'vicmsop': item.vicmsop,
                  'pdif': item.pdif,
                  'vicmsdif': item.vicmsdif,
                  'vbcfcp': item.vbcfcp,
                  'pfcp': item.pfcp,
                  'vfcp': item.vfcp,
                  'vbcfcpstret': item.vbcfcpstret,
                  'pfcpstret': item.pfcpstret,
                  'vfcpstret': item.vfcpstret,
                  'pst': item.pst,
                  'cenq': item.cenq,
                  'cstipi': item.cstipi,
                  'vbcipi': item.vbcipi,
                  'pipi': item.pipi,
                  'vipi': item.vipi,
                  'qunid': item.qunid,
                  'vunid': item.vunid,
                  'cstpis': item.cstpis,
                  'vbcpis': item.vbcpis,
                  'ppis': item.ppis,
                  'vpis': item.vpis,
                  'qbcprodpis': item.qbcprodpis,
                  'valiqprodpis': item.valiqprodpis,
                  'cstcofins': item.cstcofins,
                  'vbccofins': item.vbccofins,
                  'pcofins': item.pcofins,
                  'vcofins': item.vcofins,
                  'qbcprodcofins': item.qbcprodcofins,
                  'valiqprodcofins': item.valiqprodcofins
                }),
        _vendaItemEntityDeletionAdapter = DeletionAdapter(
            database,
            'venda_item',
            ['id'],
            (VendaItemEntity item) => <String, Object?>{
                  'id': item.id,
                  'id_venda': item.idVenda,
                  'cprod': item.cprod,
                  'cean': item.cean,
                  'xprod': item.xprod,
                  'ncm': item.ncm,
                  'cest': item.cest,
                  'cfop': item.cfop,
                  'ucom': item.ucom,
                  'qcom': item.qcom,
                  'vuncom': item.vuncom,
                  'vprod': item.vprod,
                  'ceantrib': item.ceantrib,
                  'utrib': item.utrib,
                  'vuntrib': item.vuntrib,
                  'vfrete': item.vfrete,
                  'vseg': item.vseg,
                  'vdesc': item.vdesc,
                  'voutro': item.voutro,
                  'indtot': item.indtot,
                  'orig': item.orig,
                  'csticms': item.csticms,
                  'modbc': item.modbc,
                  'predbc': item.predbc,
                  'vbcicms': item.vbcicms,
                  'picms': item.picms,
                  'vicms': item.vicms,
                  'modbcst': item.modbcst,
                  'pmvast': item.pmvast,
                  'predbcst': item.predbcst,
                  'vbcst': item.vbcst,
                  'picmsst': item.picmsst,
                  'vicmsst': item.vicmsst,
                  'vbcstret': item.vbcstret,
                  'vicmsstret': item.vicmsstret,
                  'vbcstdest': item.vbcstdest,
                  'vicmsstdest': item.vicmsstdest,
                  'pbcop': item.pbcop,
                  'pcredsn': item.pcredsn,
                  'vcredicmssn': item.vcredicmssn,
                  'vicmsdeson': item.vicmsdeson,
                  'vicmsop': item.vicmsop,
                  'pdif': item.pdif,
                  'vicmsdif': item.vicmsdif,
                  'vbcfcp': item.vbcfcp,
                  'pfcp': item.pfcp,
                  'vfcp': item.vfcp,
                  'vbcfcpstret': item.vbcfcpstret,
                  'pfcpstret': item.pfcpstret,
                  'vfcpstret': item.vfcpstret,
                  'pst': item.pst,
                  'cenq': item.cenq,
                  'cstipi': item.cstipi,
                  'vbcipi': item.vbcipi,
                  'pipi': item.pipi,
                  'vipi': item.vipi,
                  'qunid': item.qunid,
                  'vunid': item.vunid,
                  'cstpis': item.cstpis,
                  'vbcpis': item.vbcpis,
                  'ppis': item.ppis,
                  'vpis': item.vpis,
                  'qbcprodpis': item.qbcprodpis,
                  'valiqprodpis': item.valiqprodpis,
                  'cstcofins': item.cstcofins,
                  'vbccofins': item.vbccofins,
                  'pcofins': item.pcofins,
                  'vcofins': item.vcofins,
                  'qbcprodcofins': item.qbcprodcofins,
                  'valiqprodcofins': item.valiqprodcofins
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<VendaItemEntity> _vendaItemEntityInsertionAdapter;

  final UpdateAdapter<VendaItemEntity> _vendaItemEntityUpdateAdapter;

  final DeletionAdapter<VendaItemEntity> _vendaItemEntityDeletionAdapter;

  @override
  Future<List<VendaItemEntity>> getById(int id) async {
    return _queryAdapter.queryList(
        'select *       from venda_item      where venda_item.id_venda = ?1',
        mapper: (Map<String, Object?> row) => VendaItemEntity(
            id: row['id'] as int?,
            idVenda: row['id_venda'] as int?,
            cprod: row['cprod'] as String?,
            cean: row['cean'] as String?,
            xprod: row['xprod'] as String?,
            ncm: row['ncm'] as String?,
            cest: row['cest'] as String?,
            cfop: row['cfop'] as int?,
            ucom: row['ucom'] as String?,
            qcom: row['qcom'] as double?,
            vuncom: row['vuncom'] as double?,
            vprod: row['vprod'] as double?,
            ceantrib: row['ceantrib'] as String?,
            utrib: row['utrib'] as String?,
            vuntrib: row['vuntrib'] as double?,
            vfrete: row['vfrete'] as double?,
            vseg: row['vseg'] as double?,
            vdesc: row['vdesc'] as double?,
            voutro: row['voutro'] as double?,
            indtot: row['indtot'] as int?,
            orig: row['orig'] as String?,
            csticms: row['csticms'] as String?,
            modbc: row['modbc'] as int?,
            predbc: row['predbc'] as double?,
            vbcicms: row['vbcicms'] as double?,
            picms: row['picms'] as double?,
            vicms: row['vicms'] as double?,
            modbcst: row['modbcst'] as int?,
            pmvast: row['pmvast'] as double?,
            predbcst: row['predbcst'] as double?,
            vbcst: row['vbcst'] as double?,
            picmsst: row['picmsst'] as double?,
            vicmsst: row['vicmsst'] as double?,
            vbcstret: row['vbcstret'] as double?,
            vicmsstret: row['vicmsstret'] as double?,
            vbcstdest: row['vbcstdest'] as double?,
            vicmsstdest: row['vicmsstdest'] as double?,
            pbcop: row['pbcop'] as double?,
            pcredsn: row['pcredsn'] as double?,
            vcredicmssn: row['vcredicmssn'] as double?,
            vicmsdeson: row['vicmsdeson'] as double?,
            vicmsop: row['vicmsop'] as double?,
            pdif: row['pdif'] as double?,
            vicmsdif: row['vicmsdif'] as double?,
            vbcfcp: row['vbcfcp'] as double?,
            pfcp: row['pfcp'] as double?,
            vfcp: row['vfcp'] as double?,
            vbcfcpstret: row['vbcfcpstret'] as double?,
            pfcpstret: row['pfcpstret'] as double?,
            vfcpstret: row['vfcpstret'] as double?,
            pst: row['pst'] as double?,
            cenq: row['cenq'] as String?,
            cstipi: row['cstipi'] as String?,
            vbcipi: row['vbcipi'] as double?,
            pipi: row['pipi'] as double?,
            vipi: row['vipi'] as double?,
            qunid: row['qunid'] as double?,
            vunid: row['vunid'] as double?,
            cstpis: row['cstpis'] as String?,
            vbcpis: row['vbcpis'] as double?,
            ppis: row['ppis'] as double?,
            vpis: row['vpis'] as double?,
            qbcprodpis: row['qbcprodpis'] as double?,
            valiqprodpis: row['valiqprodpis'] as double?,
            cstcofins: row['cstcofins'] as String?,
            vbccofins: row['vbccofins'] as double?,
            pcofins: row['pcofins'] as double?,
            vcofins: row['vcofins'] as double?,
            qbcprodcofins: row['qbcprodcofins'] as double?,
            valiqprodcofins: row['valiqprodcofins'] as double?),
        arguments: [id]);
  }

  @override
  Future<void> insertData(VendaItemEntity entityInstance) async {
    await _vendaItemEntityInsertionAdapter.insert(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertListData(List<VendaItemEntity> entityInstance) async {
    await _vendaItemEntityInsertionAdapter.insertList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateData(VendaItemEntity entityInstance) async {
    await _vendaItemEntityUpdateAdapter.update(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateListData(List<VendaItemEntity> entityInstance) async {
    await _vendaItemEntityUpdateAdapter.updateList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteData(VendaItemEntity entityInstance) async {
    await _vendaItemEntityDeletionAdapter.delete(entityInstance);
  }
}

class _$ProdutoGrupoDAO extends ProdutoGrupoDAO {
  _$ProdutoGrupoDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _produtosGrupoEntityInsertionAdapter = InsertionAdapter(
            database,
            'produto_grupo',
            (ProdutosGrupoEntity item) => <String, Object?>{
                  'id': item.id,
                  'descricao': item.descricao,
                  'color': item.color
                }),
        _produtosGrupoEntityUpdateAdapter = UpdateAdapter(
            database,
            'produto_grupo',
            ['id'],
            (ProdutosGrupoEntity item) => <String, Object?>{
                  'id': item.id,
                  'descricao': item.descricao,
                  'color': item.color
                }),
        _produtosGrupoEntityDeletionAdapter = DeletionAdapter(
            database,
            'produto_grupo',
            ['id'],
            (ProdutosGrupoEntity item) => <String, Object?>{
                  'id': item.id,
                  'descricao': item.descricao,
                  'color': item.color
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProdutosGrupoEntity>
      _produtosGrupoEntityInsertionAdapter;

  final UpdateAdapter<ProdutosGrupoEntity> _produtosGrupoEntityUpdateAdapter;

  final DeletionAdapter<ProdutosGrupoEntity>
      _produtosGrupoEntityDeletionAdapter;

  @override
  Future<List<ProdutosGrupoEntity>> obterGrupos() async {
    return _queryAdapter.queryList(
        'SELECT *   FROM produto_grupo   ORDER BY id',
        mapper: (Map<String, Object?> row) => ProdutosGrupoEntity(
            id: row['id'] as int?,
            descricao: row['descricao'] as String?,
            color: row['color'] as String?));
  }

  @override
  Future<void> insertData(ProdutosGrupoEntity entityInstance) async {
    await _produtosGrupoEntityInsertionAdapter.insert(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertListData(List<ProdutosGrupoEntity> entityInstance) async {
    await _produtosGrupoEntityInsertionAdapter.insertList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateData(ProdutosGrupoEntity entityInstance) async {
    await _produtosGrupoEntityUpdateAdapter.update(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateListData(List<ProdutosGrupoEntity> entityInstance) async {
    await _produtosGrupoEntityUpdateAdapter.updateList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteData(ProdutosGrupoEntity entityInstance) async {
    await _produtosGrupoEntityDeletionAdapter.delete(entityInstance);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
