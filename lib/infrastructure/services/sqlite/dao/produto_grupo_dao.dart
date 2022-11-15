import 'package:floor/floor.dart';
import 'package:pdvandroid_flutter/domain/interfaces/sqlite_dao_interface.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/produtos_grupos_entity.dart';

@dao
abstract class ProdutoGrupoDAO extends ISQLiteDAO<ProdutosGrupoEntity> {
  @Query('''
  SELECT *
  FROM produto_grupo
  ORDER BY id
  ''')
  Future<List<ProdutosGrupoEntity>> obterGrupos();
}
