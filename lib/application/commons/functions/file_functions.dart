import 'dart:io';

Future ifFileExistsDeleteFile(File file) async {
  if (await file.exists()) {
    await file.delete();
  }
}

Future ifFileExistsDeleteFileFromPath(String filePath) async {
  if (await File(filePath).exists()) {
    await File(filePath).delete();
  }
}

Future<bool> fileExists(String filePath) async {
  if (await File(filePath).exists()) {
    return true;
  } else {
    return false;
  }
}
