import 'package:floor/floor.dart';
import 'package:pdvandroid_flutter/domain/interfaces/sqlite_dao_interface.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/empresa_entity.dart';

@dao
abstract class EmpresaDAO extends ISQLiteDAO<EmpresaEntity> {
  @Query('''
  SELECT *
  FROM empresa
  ORDER BY id
  ''')
  Future<List<EmpresaEntity>> findAll();

  @Query('''
  SELECT *
  FROM empresa
  ORDER BY id
  ''')
  Stream<List<EmpresaEntity>> findAllStream();

  @Query('''
  SELECT *
  FROM empresa
  WHERE nome like '%' || :nome || '%'
  ORDER BY id
  ''')
  Future<List<EmpresaEntity>> findByName(String nome);

  @Query('''
  SELECT *
  FROM empresa
  WHERE ( nome || cnpj || ie ) like '%' || :nome || '%'
  ORDER BY id
  ''')
  Future<List<EmpresaEntity>> findByText(String nome);

  @Query('''
  SELECT *
  FROM empresa
  WHERE nome like '%' || :nome || '%'
  ORDER BY id
  ''')
  Stream<List<EmpresaEntity>> findByNameStream(String nome);

  @Query('''
  SELECT *
  FROM empresa
  WHERE id = :id
  ORDER BY id
  ''')
  Future<EmpresaEntity?> findById(int id);

  @Query('''
  DELETE 
  FROM empresa 
  WHERE id = :id
  ''')
  Future<void> deleteDataById(int id);
}
