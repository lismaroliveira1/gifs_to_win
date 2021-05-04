import 'dart:convert';

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import '../model/model.dart';

import './commons/commons.dart';

class GetXSavedPresenter extends GetxController {
  final ImageResults result;
  GetXSavedPresenter({@required this.result});

  var _imageListSaved = <dynamic>[].obs;

  @override
  void onInit() async {
    await result.repository.getAll(limit: 15, offset: 1);
    var listSavedCache = await readData('saved');
    _imageListSaved.value = jsonDecode(listSavedCache);
    print(listSavedCache.length);
    super.onInit();
  }
}
