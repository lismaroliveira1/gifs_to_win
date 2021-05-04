import 'dart:convert';

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import '../model/model.dart';

import './commons/commons.dart';

class GetXTrashPresenter extends GetxController {
  final ImageRepository repository;
  GetXTrashPresenter({@required this.repository});

  var _blackList = <dynamic>[].obs;

  List<ImageModel> get imageDeletedListStream => _blackList.toList();

  @override
  void onInit() async {
    await repository.getAll(limit: 15, offset: 1);
    var blackListCache = await readData('deleted');
    _blackList.value = jsonDecode(blackListCache);
    super.onInit();
  }
}
