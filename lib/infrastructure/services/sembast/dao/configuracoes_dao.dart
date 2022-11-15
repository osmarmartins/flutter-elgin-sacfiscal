import 'dart:io';

import 'package:get/get.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sembast/connection/sembast_connection.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sembast/entity/configuracoes_entity.dart';
import 'package:sembast/sembast.dart';

class ConfiguracoesDao {
  static const String folderName = 'configuracoes';
  final _studentFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await SembastConnection(
        databaseDirectory: Get.find<Directory>().path,
        databaseName: 'configuracoes',
      ).database;

  Future<ConfigruacoesEntity> getConfig() async {
    final recordSnapshot = await _studentFolder.find(await _db);
    List<ConfigruacoesEntity>? configuracoesEntityList = recordSnapshot.map(
      (snapshot) {
        final student = ConfigruacoesEntity.fromJson(snapshot.value);
        return student;
      },
    ).toList();

    ConfigruacoesEntity? configuracoesEntity;

    try {
      if (configuracoesEntityList.isNotEmpty) {
        configuracoesEntity = configuracoesEntityList[0];
      } else {
        configuracoesEntity = ConfigruacoesEntity(
          logado: false,
        );
        await insertData(configuracoesEntity);
      }
    } catch (e) {
      configuracoesEntity = ConfigruacoesEntity(
        logado: false,
      );
      await insertData(configuracoesEntity);
    }

    return configuracoesEntity;
  }

  Future insertData(ConfigruacoesEntity entityInstance) async {
    entityInstance.id = 1;
    await _studentFolder.add(
      await _db,
      entityInstance.toJson(),
    );
  }

  Future updateData(ConfigruacoesEntity entityInstance) async {
    final finder = Finder(
      filter: Filter.byKey(entityInstance.id),
    );
    await _studentFolder.update(
      await _db,
      entityInstance.toJson(),
      finder: finder,
    );
  }
}
