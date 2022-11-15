import 'package:floor/floor.dart';
import 'package:pdvandroid_flutter/domain/interfaces/sqlite_dao_interface.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/caixa_entity.dart';

@dao
abstract class CaixaDAO extends ISQLiteDAO<CaixaEntity> {
  @Query('''
    select *
      from caixa
     where caixa.id = :id
       and date(abertura) = date(:data)
       and caixa.fechamento is null
  ''')
  Future<CaixaEntity?> obterRegistroDeCaixa(
    int id,
    String data,
  );

  @Query('''
    select *
      from caixa
     where date(abertura) = date(:data)
  ''')
  Future<List<CaixaEntity>?> obterRegistroDeCaixaDia(String data);
}
