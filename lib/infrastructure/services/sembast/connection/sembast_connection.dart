import 'dart:async';
import 'dart:io';

import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

class SembastConnection {
  late String databaseDirectory;
  late String databaseName;

  Completer<Database> _dbOpenCompleter = Completer();

  SembastConnection({
    required this.databaseDirectory,
    required this.databaseName,
  });

  Future<Database> get database async {
    if (!_dbOpenCompleter.isCompleted) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }

    return _dbOpenCompleter.future;
  }

  Future _openDatabase() async {
    final appDocumentDir = Directory(databaseDirectory);
    final dbPath = join(appDocumentDir.path, databaseName);
    final database = await databaseFactoryIo.openDatabase(dbPath);

    _dbOpenCompleter.complete(database);
  }

  Future<int>? findLastKey(String storeName) async {
    try {
      final localStore = intMapStoreFactory.store(storeName);
      var firstRecord = await localStore.find(await database);
      return firstRecord[firstRecord.length - 1].key;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<RecordSnapshot<int, Map<String, Object?>>>? findLastRecord(String storeName) async {
    try {
      final localStore = intMapStoreFactory.store(storeName);
      var firstRecord = await localStore.find(await database);
      return firstRecord[firstRecord.length - 1];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<dynamic>? findLastRecordField(String storeName, String fieldName) async {
    try {
      final localStore = intMapStoreFactory.store(storeName);
      var firstRecord = await localStore.find(await database);
      return firstRecord[firstRecord.length - 1][fieldName];
    } catch (e) {
      throw e.toString();
    }
  }
}
