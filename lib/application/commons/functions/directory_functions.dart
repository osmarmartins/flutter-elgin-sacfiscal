import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<Directory> obterDiretorioLocal({String? subDiretorio}) async {
  final Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();

  String directoryName = (subDiretorio == null)
      ? '${appDocumentsDirectory.path}/$subDiretorio'
      : '${appDocumentsDirectory.path}/$subDiretorio';

  final Directory localDirectory = await Directory(directoryName).create(recursive: true);

  return localDirectory;
}

Future<void> deleteCacheDir() async {
  final cacheDir = await getTemporaryDirectory();

  if (cacheDir.existsSync()) {
    cacheDir.deleteSync(recursive: true);
  }
}

Future<void> deleteAppDir() async {
  final appDir = await getApplicationSupportDirectory();

  if (appDir.existsSync()) {
    appDir.deleteSync(recursive: true);
  }
}
