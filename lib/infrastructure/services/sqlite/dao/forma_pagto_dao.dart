import 'package:floor/floor.dart';
import 'package:pdvandroid_flutter/domain/interfaces/sqlite_dao_interface.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/forma_pagto_entity.dart';

@dao
abstract class FormaPagtoDAO extends ISQLiteDAO<FormaPagtoEntity> {
  @Query('''
  SELECT *
  FROM forma_pagto
  ORDER BY id
  ''')
  Future<List<FormaPagtoEntity>> findAll();

  @Query('''
  SELECT *
  FROM forma_pagto
  ORDER BY id
  ''')
  Stream<List<FormaPagtoEntity>> findAllStream();

  @Query('''
  SELECT *
  FROM forma_pagto
  WHERE descricao like '%' || :descricao || '%'
  ORDER BY id
  ''')
  Future<List<FormaPagtoEntity>> findByName(String descricao);

  @Query('''
  SELECT *
  FROM forma_pagto
  WHERE descricao like '%' || :descricao || '%'
  ORDER BY id
  ''')
  Stream<List<FormaPagtoEntity>> findByNameStream(String descricao);

  @Query('''
  SELECT *
  FROM forma_pagto
  WHERE id = :id
  ORDER BY id
  ''')
  Future<FormaPagtoEntity?> findById(int id);

  @Query('''
  DELETE 
  FROM forma_pagto 
  WHERE id = :id
  ''')
  Future<void> deleteDataById(int id);
}
