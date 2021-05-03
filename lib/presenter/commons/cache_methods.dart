import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> get localPath async {
  final path = await getApplicationSupportDirectory();
  return path.path;
}

Future<File> get localFile async {
  final file = await localPath;

  return new File('$file/data.txt');
}

Future<void> writeData(String jsonString) async {
  final file = await localFile;
  file.writeAsStringSync(jsonString);
}

Future<String> readData() async {
  try {
    final file = await localFile;
    String data = await file.readAsString();
    return data;
  } catch (e) {
    return '{[]}';
  }
}
