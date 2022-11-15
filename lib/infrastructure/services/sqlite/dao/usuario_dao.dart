import 'package:floor/floor.dart';
import 'package:pdvandroid_flutter/domain/interfaces/sqlite_dao_interface.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/usuario_entity.dart';

@dao
abstract class UsuuarioDAO extends ISQLiteDAO<UsuarioEntity> {
  @Query('''
  SELECT *
  FROM usuario
  ORDER BY id
  ''')
  Future<List<UsuarioEntity>> findAll();

  @Query('''
  SELECT *
  FROM usuario
  ORDER BY id
  ''')
  Stream<List<UsuarioEntity>> findAllStream();

  @Query('''
  SELECT *
  FROM usuario
  WHERE usuario like '%' || :usuario || '%'
  ORDER BY id
  ''')
  Future<List<UsuarioEntity>> findByName(String usuario);

  @Query('''
  SELECT *
  FROM usuario
  WHERE usuario = :usuario
  ORDER BY id
  ''')
  Future<UsuarioEntity?> login(String usuario);

  @Query('''
  SELECT *
  FROM usuario
  WHERE usuario like '%' || :usuario || '%'
  ORDER BY id
  ''')
  Stream<List<UsuarioEntity>> findByNameStream(String usuario);

  @Query('''
  SELECT *
  FROM usuario
  WHERE id = :id
  ORDER BY id
  ''')
  Future<UsuarioEntity?> findById(int id);

  @Query('''
  DELETE 
  FROM usuario 
  WHERE id = :id
  ''')
  Future<void> deleteDataById(int id);
}
