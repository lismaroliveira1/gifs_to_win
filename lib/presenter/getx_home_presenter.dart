import 'dart:convert';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../models/model.dart';
import './commons/commons.dart';

class HomePresenter extends GetxController {
  final ImageRepository repository;
  HomePresenter({
    @required this.repository,
  });

  var _imageList = <ImageModel>[].obs;
  var _imageListSaved = <dynamic>[].obs;
  var _defaultLimit = 15.obs;
  var _defaultOffset = 1.obs;
  List<ImageModel> get imageListStream => _imageList.toList();
  int get limitImageView => _defaultLimit.toInt();
  @override
  void onInit() async {
    var listCache = await readData();
    _imageListSaved.value = jsonDecode(listCache);
    print(_imageListSaved.length);
    _imageList.value =
        await repository.getAll(limit: _defaultLimit.value, offset: 1);

    super.onInit();
  }

  void changeTotalPerPage({@required int limit}) async {
    _defaultLimit.value = limit;
    _imageList.value =
        await repository.getAll(limit: _defaultLimit.value, offset: 1);
  }

  void getMoreImages() async {
    var newList = await repository.getAll(
        limit: _defaultLimit.value, offset: _defaultOffset.value++);
    newList.forEach((element) {
      _imageList.add(element);
    });
  }

  void editImage({@required String id, @required String title}) {
    _imageList.forEach((image) {
      if (image.id == id) {
        image.title = title;
      }
    });
  }

  Future<void> saveImage({
    @required String id,
    @required String title,
    @required String url,
  }) async {
    _imageListSaved.add({
      'id': id,
      'title': title,
      'url': url,
    });
    await writeData(jsonEncode(_imageListSaved));
    print(_imageListSaved.length);
  }
}
