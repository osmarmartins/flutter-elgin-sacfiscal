import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'application/application_widget.dart';
import 'application/commons/functions/directory_functions.dart';
import 'infrastructure/services/sembast/dao/configuracoes_dao.dart';
import 'infrastructure/services/sembast/entity/configuracoes_entity.dart';
import 'infrastructure/services/sqlite/connection/sqlite_connection.dart';
import 'infrastructure/services/sqlite/exports/sqlite_seeds_exports.dart';
import 'infrastructure/services/sqlite/seeds/empresas_seeds.dart';
import 'infrastructure/services/sqlite/seeds/produto_grupo_seeds.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(
    ApplicationWidget(),
  );
}

init() async {
  final Directory localDirectory = await obterDiretorioLocal(
    subDiretorio: 'database',
  );

  Get.put<Directory>(
    localDirectory,
    permanent: true,
  );

  ConfiguracoesDao configuracoesDao = ConfiguracoesDao();

  Get.put<ConfiguracoesDao>(
    configuracoesDao,
    permanent: true,
  );

  ConfigruacoesEntity? configuracoesEntity = await configuracoesDao.getConfig();

  Get.put<ConfigruacoesEntity>(
    configuracoesEntity,
    permanent: true,
  );

  SQLiteConnection database = await $FloorSQLiteConnection.databaseBuilder('pdvandroid.db').build();

  if (configuracoesEntity.inicialDataLoaded == false) {
    await databaseSeeds(database);
  }

  Get.put<SQLiteConnection>(
    database,
    permanent: true,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  Get.put<RouteObserver>(
    RouteObserver<PageRoute>(),
    permanent: true,
  );
}

databaseSeeds(SQLiteConnection database) async {
  var configuracoes = Get.find<ConfigruacoesEntity>();

  try {
    for (var valor in empresaSeed) {
      await database.database.execute('''
        INSERT OR REPLACE INTO empresa
        (
          id, nome, cnpj, ie, logradouro, numero, bairro, cidade,
          uf, ibge, cep, crt, forma_emissao, serie, ultimo_doc
        )
        VALUES
        (
           ${valor['id']},
          '${valor['nome']}',
          '${valor['cnpj']}',
          '${valor['ie']}',
          '${valor['logradouro']}',
          '${valor['numero']}',
          '${valor['bairro']}',
          '${valor['cidade']}',
          '${valor['uf']}',
          '${valor['ibge']}',
           ${valor['cep']},
           ${valor['crt']},
          '${valor['forma_emissao']}',
          '${valor['serie']}',
           ${valor['ultimo_doc']}
        );
        ''');
    }

    for (var valor in produtosSeed) {
      await database.database.execute('''
        INSERT OR REPLACE INTO produto
        (
          id, descricao, gtin, un, preco, ncm, cest, cfop, cst_icms, origem, cst_pis, 
          cst_cofins, ibpt_federal, ibpt_estadual, ibpt_municipal, aliq_icms, 
          aliq_pis, aliq_cofins, img, grupo
        )
        VALUES
        (
           ${valor['id']}, 
          '${valor['descricao']}', 
          '${valor['gtin']}', 
          '${valor['un']}', 
           ${valor['preco']}, 
          '${valor['ncm']}', 
          '${valor['cest']}', 
          '${valor['cfop']}', 
          '${valor['cst_icms']}', 
          '${valor['origem']}', 
          '${valor['cst_pis']}', 
           ${valor['cst_cofins']}, 
           ${valor['ibpt_federal']}, 
           ${valor['ibpt_estadual']}, 
           ${valor['ibpt_municipal']}, 
           ${valor['aliq_icms']}, 
           ${valor['aliq_pis']}, 
           ${valor['aliq_cofins']}, 
          '${valor['img']}', 
          '${valor['grupo']}'
        );
        ''');
    }

    for (var valor in produtosGruposSeed) {
      await database.database.execute('''
        INSERT OR REPLACE INTO produto_grupo
        (
          id, descricao, color
        )
        VALUES
        (
           ${valor['id']}, 
          '${valor['descricao']}',
          '${valor['color']}'
        );
        ''');
    }

    for (var valor in usuarioSeed) {
      await database.database.execute('''
        INSERT OR REPLACE INTO usuario
        (
          id, usuario, senha
        )
        VALUES
        (
           ${valor['id']}, 
          '${valor['usuario']}', 
          '${valor['senha']}'
        );
        ''');
    }

    for (var valor in clienteSeed) {
      await database.database.execute('''
        INSERT OR REPLACE INTO cliente
        (
          id, nome, cnpjcpf
        )
        VALUES
        (
           ${valor['id']}, 
          '${valor['nome']}', 
           ${valor['cnpjcpf']}
        );
        ''');
    }

    for (var valor in formaPagtoSeed) {
      await database.database.execute('''
        INSERT OR REPLACE INTO forma_pagto
        (
          id, descricao, cod_sefaz
        )
        VALUES
        (
           ${valor['id']}, 
          '${valor['descricao']}', 
           ${valor['cod_sefaz']}
        );
        ''');

      configuracoes.inicialDataLoaded = true;
      Get.find<ConfiguracoesDao>().updateData(configuracoes);
    }
  } catch (e) {
    configuracoes.inicialDataLoaded = false;
    Get.find<ConfiguracoesDao>().updateData(configuracoes);
  }
}
