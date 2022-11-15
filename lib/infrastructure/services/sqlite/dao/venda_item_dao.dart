import 'package:floor/floor.dart';
import 'package:pdvandroid_flutter/domain/interfaces/sqlite_dao_interface.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/venda_item_entity.dart';

@dao
abstract class VendaItemDAO extends ISQLiteDAO<VendaItemEntity> {
  @Query('''
    select *
      from venda_item
     where venda_item.id_venda = :id
  ''')
  Future<List<VendaItemEntity>> getById(
    int id,
  );
}
