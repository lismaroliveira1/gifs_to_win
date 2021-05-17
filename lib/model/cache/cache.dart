import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

class Cache {
  List<Map> _list;
  Future<String> get localPath async {
    final path = await getApplicationSupportDirectory();
    return path.path;
  }

  Future<File> localFile(String path) async {
    final file = await localPath;
    return new File('$file/$path.txt');
  }

  Future<void> writeData(String jsonString, {@required String path}) async {
    final file = await localFile(path);
    file.writeAsStringSync(jsonString);
  }

  Future<List<Map>> readData(String path) async {
    try {
      _list = [];
      final file = await localFile(path);
      String data = await file.readAsString();
      final _listDynamic = jsonDecode(data);
      _listDynamic.forEach((element) {
        _list.add(element);
      });
      return _list;
    } catch (e) {
      return [];
    }
  }

  Future<void> verifyCache() async {
    final List<Map> setupData = await readData('setup');
    if (setupData.length == 0) {
      final defaultSetupMap = [
        {
          'imagePerPage': 30,
          'imageQuality': 2,
          'themeMode': 3,
        }
      ];
      writeData(jsonEncode(defaultSetupMap), path: 'setup');
    }
  }
}
