import 'package:floor/floor.dart';
import 'package:pdvandroid_flutter/domain/interfaces/sqlite_dao_interface.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/venda_entity.dart';

@dao
abstract class VendaDAO extends ISQLiteDAO<VendaEntity> {
  @Query('''
    select *
      from venda
     where venda.id = :id
  ''')
  Future<VendaEntity?> obterRegistroDeVendaPorId(
    int id,
  );

  @Query('''
    select *
      from venda
     where venda.id = :id
       and date(dhemi) = date(:data)
  ''')
  Future<VendaEntity?> obterRegistroDeVendaPorData(
    int id,
    String data,
  );

  @Query('''
    select *
      from venda
     where date(dhemi) = date(:data)      
  ''')
  Future<List<VendaEntity>?> obterRegistroDeVendaDia(String data);

  @Query('''
    select *
      from venda
  ''')
  Future<List<VendaEntity>?> obterRegistroDeVenda();
}
