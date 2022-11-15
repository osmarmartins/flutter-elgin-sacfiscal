import 'package:floor/floor.dart';
import 'package:pdvandroid_flutter/domain/interfaces/sqlite_dao_interface.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/cliente_entity.dart';

@dao
abstract class ClienteDAO extends ISQLiteDAO<ClienteEntity> {
  @Query('''
  SELECT *
  FROM cliente
  ORDER BY id
  ''')
  Future<List<ClienteEntity>> findAll();

  @Query('''
  SELECT *
  FROM cliente
  ORDER BY id
  ''')
  Stream<List<ClienteEntity>> findAllStream();

  @Query('''
  SELECT *
  FROM cliente
  WHERE nome like '%' || :nome || '%'
  ORDER BY id
  ''')
  Future<List<ClienteEntity>> findByName(String nome);

  @Query('''
  SELECT *
  FROM cliente
  WHERE nome like '%' || :nome || '%'
  ORDER BY id
  ''')
  Stream<List<ClienteEntity>> findByNameStream(String nome);

  @Query('''
  SELECT *
  FROM cliente
  WHERE id = :id
  ORDER BY id
  ''')
  Future<ClienteEntity?> findById(int id);

  @Query('''
  DELETE 
  FROM cliente 
  WHERE id = :id
  ''')
  Future<void> deleteDataById(int id);
}
