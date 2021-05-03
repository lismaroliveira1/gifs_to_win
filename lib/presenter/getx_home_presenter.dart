import 'dart:convert';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../models/model.dart';
import './commons/commons.dart';

class GetXHomePresenter extends GetxController {
  final ImageRepository repository;

  GetXHomePresenter({
    @required this.repository,
  });

  var _navigateTo = RxString('/');
  var _imageList = <ImageModel>[].obs;
  var _imageDetails = Rx<ImageModel>(null);
  var _imageListSaved = <dynamic>[].obs;
  var _defaultLimit = 15.obs;
  var _defaultOffset = 1.obs;

  List<ImageModel> get imageListStream => _imageList.toList();
  ImageModel get imageDetailsStream => _imageDetails.value;
  Stream<String> get navigateToStream => _navigateTo.stream;

  int get limitImageView => _defaultLimit.toInt();
  @override
  void onInit() async {
    _navigateTo.value = '';
    var listCache = await readData();
    _imageListSaved.value = jsonDecode(listCache);
    print(_imageListSaved.length);
    _imageList.value =
        await repository.getAll(limit: _defaultLimit.value, offset: 1);

    super.onInit();
  }

  Future<void> changeTotalPerPage({@required int limit}) async {
    _defaultLimit.value = limit;
    _imageList.value =
        await repository.getAll(limit: _defaultLimit.value, offset: 1);
  }

  Future<void> getMoreImages() async {
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

  void showGifDetails({@required Map imageMap}) {
    _imageDetails.value = ImageModel.fromMap(imageMap);
    Future.delayed(Duration(milliseconds: 250), () {
      _navigateTo.value = '';
      _navigateTo.value = '/details';
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
