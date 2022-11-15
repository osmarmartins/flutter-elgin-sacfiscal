import 'dart:async';
import 'package:floor/floor.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/converter/datetime_converter.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/dao/produto_grupo_dao.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/exports/sqlite_dao_exports.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/exports/sqlite_entity_exports.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'sqlite_connection.g.dart'; // the generated code will be there

@TypeConverters([DateTimeConverter])
@Database(
  version: 1,
  entities: [
    FormaPagtoEntity,
    ClienteEntity,
    UsuarioEntity,
    ProdutosEntity,
    EmpresaEntity,
    CaixaEntity,
    VendaEntity,
    VendaItemEntity,
    ProdutosGrupoEntity,
  ],
)
abstract class SQLiteConnection extends FloorDatabase {
  FormaPagtoDAO get formaPagtoDAO;
  ClienteDAO get clienteDAO;
  UsuuarioDAO get usuarioDAO;
  ProdutoDAO get produtoDAO;
  EmpresaDAO get empresaDAO;
  CaixaDAO get caixaDAO;
  VendaDAO get vendaDAO;
  VendaItemDAO get vendaItemDAO;
  ProdutoGrupoDAO get produtoGrupoDAO;
}
