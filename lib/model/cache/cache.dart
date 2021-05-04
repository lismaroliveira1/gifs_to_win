import 'dart:convert';
import 'dart:io';
import 'package:gifs_to_win/model/image_model.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

class Cache {
  List<ImageModel> _list;
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

  Future<List<ImageModel>> readData(String path) async {
    try {
      _list = [];
      final file = await localFile(path);
      String data = await file.readAsString();
      final _listDynamic = jsonDecode(data);
      _listDynamic.forEach((element) {
        _list.add(ImageModel.fromJson(element));
      });
      print(_list.length);
      return _list;
    } catch (e) {
      return [];
    }
  }
}
