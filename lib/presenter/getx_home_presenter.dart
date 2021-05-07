import 'dart:convert';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../model/model.dart';
import './presenter.dart';

class GetXHomePresenter extends GetxController {
  final ImageResults result;
  final CommonController commons;
  GetXHomePresenter({
    @required this.result,
    @required this.commons,
  });

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

  var _navigateTo = RxString('/');
  var _jumpTo = RxString('/');
  var _imageList = <ImageModel>[].obs;
  var _imageListRelated = <ImageModel>[].obs;
  var _imageMapRelated = <Map>[];
  var _imageListMap = <Map>[].obs;
  var _imageListSearchedMap = <Map>[].obs;
  var _imageListSearched = <ImageModel>[].obs;
  var _imageListSaved = <ImageModel>[].obs;
  var _imageListDeleted = <ImageModel>[].obs;
  var _defaultLimit = 30.obs;
  var _wayViewMode = 1.obs;
  var _isValidName = false.obs;
  var _errorTextDialog = RxString(null);
  var _isLoading = true.obs;
  var _showEditImageDialog = false.obs;
  var _offsetPage = 1.obs;
  var _searchName = RxString('');
  var _imageDetailsMap = {}.obs;
  var isGettingRelateds = false.obs;

  List<ImageModel> get imageListStream => _imageList.toList();
  List<ImageModel> get imageListSearchedOut => _imageListSearched.toList();
  List<Map> get imageListMapOut => _imageListMap.toList();
  List<ImageModel> get imageListModelOut => _imageList.toList();
  List<Map> get imageListSearchedMapOut => _imageListSearchedMap.toList();
  List<ImageModel> get imageListSearchedModelOut => _imageListSearched.toList();
  ImageModel get imageDetailsOut => _imageDetails.value;
  Map get imageDetailsMapOut => _imageDetailsMap;
  List<ImageModel> get imageListRelatedStream => [];
  Stream<String> get navigateToStream => _navigateTo.stream;
  Stream<String> get jumpToStream => _jumpTo.stream;
  Stream<bool> get showEditDialogStream => _showEditImageDialog.stream;
  String get errorTextDialogOut => _errorTextDialog.value;
  int get limitImageView => _defaultLimit.toInt();
  int get wayViewModeOut => _wayViewMode.toInt();
  bool get isValidNameOut => _isValidName.value;
  bool get isLoadingStream => _isLoading.value;
  String get searchNameOut => _searchName.value;

  @override
  void onInit() async {
    clearValues();
    _imageList.value = await result.repository
        .getAll(limit: _defaultLimit.value, offset: _offsetPage.value);
    _imageList.forEach((element) async {
      _imageListRelated.value =
          await result.repository.getImagesByName(element.slug.split('_')[0]);
      _imageListRelated.forEach((element) {
        _imageMapRelated.add(element.toMap());
      });
      _imageListMap.add({
        'image': element.toMap(),
        'relateds': _imageMapRelated,
      });
    });
    _isLoading.value = false;
    super.onInit();
  }

  void changeWayViewMode(int value) async {
    _wayViewMode.value = value;
  }

  Future<void> getMoreImages() async {
    _offsetPage.value++;
    var newList =
        await result.repository.getAll(limit: 50, offset: _offsetPage.value);
    newList.forEach((element) {
      _imageList.add(element);
      _imageListMap.add(element.toMap());
    });
  }

  void showGifDetails(Map imageMap) async {
    _imageDetails.value = ImageModel.fromMap(imageMap);
    _imageDetailsMap.value = _imageDetails.value.toMap();
    await getRelatedImages(imageMap['slug'.split('_')[0]]);
  }

  Future<void> saveImage({@required Map imageMap}) async {
    List<Map> _flag = [];
    _imageListSaved.clear();
    _imageListSaved.value = await result.cache.readData('saved');
    _imageListSaved.forEach((element) {
      _flag.add(element.toMap());
    });
    _flag.add(imageMap);
    await result.cache.writeData(jsonEncode(_flag), path: 'saved');
  }

  Future<void> deleteImage({
    @required Map imageMap,
  }) async {
    _imageListDeleted.add(ImageModel.fromMap(imageMap));
    await result.cache.writeData(jsonEncode({}), path: 'deleted');
  }

  void validateDialogName(String value) {
    final validationResult = commons.validateName(value);
    _isValidName.value = validationResult['isValidName'];
    _errorTextDialog.value = validationResult['errorTextDialog'];
  }

  void validateSearchName(String value) {
    _isLoading.value = true;
    final validationResult = commons.validateName(value);
    _isValidName.value = validationResult['isValidName'];
    _errorTextDialog.value = validationResult['errorTextDialog'];
    _isLoading.value = false;
  }

  void makeValidateNameFalse() {
    _isValidName.value = false;
  }

  void jumpToPage(String page) {
    _jumpTo.value = page;
  }

  void moveToBlakiList(
    Map imageGif,
  ) async {
    List<Map> _flag = [];
    _imageListDeleted.clear();
    _imageListSaved.value = await result.cache.readData('deleted');
    _imageListSaved.forEach((element) {
      _flag.add(element.toMap());
    });
    _flag.add(imageGif);
    await result.cache.writeData(jsonEncode(_flag), path: 'deleted');
    _navigateTo.value = '/';
  }

  void onSubmited(String value) async {
    _isLoading.value = true;
    _searchName.value = value;
    _errorTextDialog.value = null;
    _imageListSearched.value = await result.repository.getImagesByName(value);
    _imageListSearchedMap.clear();
    _imageListSearched.forEach((element) {
      _imageListSearchedMap.add(element.toMap());
    });
    _isLoading.value = false;
  }

  void clearValues() {
    _imageList.clear();
    _imageListSearched.clear();
    _imageListSearchedMap.clear();
    _imageListRelated.clear();
    _imageMapRelated.clear();
  }

  void closeSearch() {
    _imageListSearched.clear();
    _imageListSearchedMap.clear();
  }

  void showEditDialog() {
    _showEditImageDialog.value = !_showEditImageDialog.value;
  }

  Future<void> getRelatedImages(String name) async {
    isGettingRelateds.value = true;
    _imageListRelated.value = await result.repository.getImagesByName(name);
    _imageListRelated.forEach((element) {
      _imageMapRelated.add(element.toMap());
    });
  }

  void clearRelatedList() {
    _imageListRelated.clear();
    _imageMapRelated.clear();
  }
}
