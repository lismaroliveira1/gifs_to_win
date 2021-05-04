import 'dart:io';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get localPath async {
  final path = await getApplicationSupportDirectory();
  return path.path;
}

Future<File> localFile(String path) async {
  final file = await localPath;
  return new File('$file/path.txt');
}

Future<void> writeData(String jsonString, {@required String path}) async {
  final file = await localFile(path);
  file.writeAsStringSync(jsonString);
}

Future<String> readData(String path) async {
  try {
    final file = await localFile(path);
    String data = await file.readAsString();
    return data == "{[]}" || data == "{}" || data == "[]" || data == ""
        ? '{}'
        : data;
  } catch (e) {
    return '{[]}';
  }
}
