import 'dart:convert';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../model/model.dart';

class GetXHomePresenter extends GetxController {
  final ImageResults result;

  GetXHomePresenter({
    @required this.result,
  });

  var _navigateTo = RxString('/');
  var _jumpTo = RxString('/');
  var _imageList = <ImageModel>[].obs;
  var _imageListMap = <Map>[].obs;
  var _imageListRelated = <ImageModel>[].obs;
  var _imageDetails = ImageModel(
    id: '',
    url: '',
    username: '',
    title: '',
    slug: '',
    rating: '',
    importDateTime: '',
    height: '',
    width: '',
    size: '',
  ).obs;
  var _imageListSaved = <ImageModel>[].obs;
  var _imageListDeleted = <ImageModel>[].obs;
  var _defaultLimit = 30.obs;
  var _isValidName = false.obs;
  var _errorTextDialog = RxString(null);

  List<ImageModel> get imageListStream => _imageList.toList();
  List<Map> get imageListMapOut => _imageListMap.toList();
  ImageModel get imageDetailsStream => _imageDetails.value;
  List<ImageModel> get imageListRelatedStream => [];
  Stream<String> get navigateToStream => _navigateTo.stream;
  Stream<String> get jumpToStream => _jumpTo.stream;
  String get errorTextDialogStream => _errorTextDialog.value;
  int get limitImageView => _defaultLimit.toInt();
  bool get isValidNameStream => _isValidName.value;

  @override
  void onInit() async {
    _navigateTo.value = '';
    _imageList.clear();
    _imageList.value =
        await result.repository.getAll(limit: _defaultLimit.value, offset: 1);
    _imageList.forEach((element) {
      _imageListMap.add(element.toMap());
    });
    super.onInit();
  }

  void changeTotalPerPage(int limit) async {
    _defaultLimit.value = limit;
    _imageList.value =
        await result.repository.getAll(limit: _defaultLimit.value, offset: 1);
  }

  void changeViewMode(int limit) async {}

  Future<void> getMoreImages() async {
    var newList = await result.repository.getRandom();
    newList.forEach((element) {
      _imageList.add(element);
      _imageListMap.add(element.toMap());
    });
  }

  void editImage({@required String id, @required String title}) {
    _imageList.forEach((image) {
      if (image.id == id) {
        image.title = title;
      }
    });
  }

  void showGifDetails(Map imageMap) async {
    _imageDetails.value = ImageModel.fromMap(imageMap);
    Future.delayed(Duration(milliseconds: 250), () {
      _navigateTo.value = '';
      _navigateTo.value = '/details';
    });
    _imageListRelated.value =
        await result.repository.getImagesByName(imageMap['username']);
  }

  Future<void> saveImage({
    @required String id,
    @required String title,
    @required String url,
  }) async {
    List<Map> _flag = [];
    _imageListSaved.clear();
    _imageListSaved.value = await result.cache.readData('saved');
    _imageListSaved.forEach((element) {
      _flag.add({
        'id': element.id,
        'title': element.title,
        'url': element.url,
      });
    });
    _flag.add({
      'id': id,
      'title': title,
      'url': url,
    });
    await result.cache.writeData(jsonEncode(_flag), path: 'saved');
  }

  Future<void> deleteImage({
    @required String id,
    @required String title,
    @required String url,
  }) async {
    _imageListDeleted.add(ImageModel.fromMap({
      'id': id,
      'title': title,
      'url': url,
    }));
    await result.cache.writeData(jsonEncode({}), path: 'deleted');
  }

  void validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      _isValidName.value = false;
      _errorTextDialog.value = null;
    } else if (value.length > 0 && value.length < 4) {
      _errorTextDialog.value = "Informe o nome";
      _isValidName.value = false;
    } else if (!regExp.hasMatch(value)) {
      _errorTextDialog.value = "O nome deve conter caracteres de a-z ou A-Z";
      _isValidName.value = false;
    } else {
      _isValidName.value = true;
      _errorTextDialog.value = null;
    }
  }

  void makeValidateNameFalse() {
    _isValidName.value = false;
  }

  void jumpToPage(String page) {
    _jumpTo.value = page;
  }

  void moveToBlakiList({
    @required String id,
    @required String title,
    @required String url,
  }) async {
    List<Map> _flag = [];
    _imageListDeleted.clear();
    _imageListSaved.value = await result.cache.readData('deleted');
    _imageListSaved.forEach((element) {
      _flag.add({
        'id': element.id,
        'title': element.title,
        'url': element.url,
      });
    });
    _flag.add({
      'id': id,
      'title': title,
      'url': url,
    });
    await result.cache.writeData(jsonEncode(_flag), path: 'deleted');
    _navigateTo.value = '/';
  }
}
