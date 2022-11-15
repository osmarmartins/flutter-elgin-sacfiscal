import 'package:floor/floor.dart';
import 'package:pdvandroid_flutter/domain/interfaces/sqlite_dao_interface.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/produtos_entity.dart';

@dao
abstract class ProdutoDAO extends ISQLiteDAO<ProdutosEntity> {
  @Query('''
  SELECT *
  FROM produto
  ORDER BY id
  ''')
  Future<List<ProdutosEntity>> findAll();

  @Query('''
  SELECT *
  FROM produto
  WHERE grupo = :grupo
  ORDER BY id
  ''')
  Future<List<ProdutosEntity>> findAllByGrupo(String grupo);

  @Query('''
  SELECT *
  FROM produto
  ORDER BY id
  ''')
  Stream<List<ProdutosEntity>> findAllStream();

  @Query('''
  SELECT *
  FROM produto
  WHERE descricao like '%' || :descricao || '%'
  ORDER BY id
  ''')
  Future<List<ProdutosEntity>> findByName(String descricao);

  @Query('''
  SELECT *
  FROM produto
  WHERE ( descricao || '-' || gtin ) like '%' || :descricao || '%'
  AND grupo like '%' || :grupo || '%' 
  ORDER BY id
  ''')
  Future<List<ProdutosEntity>> findByText(String descricao, String grupo);

  @Query('''
  SELECT *
  FROM produto
  WHERE descricao like '%' || :descricao || '%'
  ORDER BY id
  ''')
  Stream<List<ProdutosEntity>> findByNameStream(String descricao);

  @Query('''
  SELECT *
  FROM produto
  WHERE id = :id
  ORDER BY id
  ''')
  Future<ProdutosEntity?> findById(int id);

  @Query('''
  DELETE 
  FROM produto 
  WHERE id = :id
  ''')
  Future<void> deleteDataById(int id);
}
