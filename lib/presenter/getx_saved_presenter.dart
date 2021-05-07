import 'dart:convert';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../model/model.dart';
import './presenter.dart';

class GetXSavedPresenter extends GetxController {
  final ImageResults result;
  final CommonController commons;
  GetXSavedPresenter({
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
  var _isLoading = true.obs;
  var _isValidName = false.obs;
  var _errorTextDialog = RxString(null);
  var _imageListSaved = <ImageModel>[].obs;
  var _jumpTo = RxString('/');
  var _imageListSearchedMap = <Map>[].obs;
  var _wayViewMode = 1.obs;
  var _imageDetailsMap = {}.obs;
  var _imageListDeleted = <ImageModel>[].obs;
  var _navigateTo = RxString('/');
  var _showEditImageDialog = false.obs;

  List<ImageModel> get imageSavedListStream => _imageListSaved.toList();
  String get errorTextDialogStream => _errorTextDialog.value;
  List<Map> get imageListSearchedMapOut => _imageListSearchedMap.toList();
  int get wayViewModeOut => _wayViewMode.toInt();
  Map get imageDetailsMapOut => _imageDetailsMap;
  ImageModel get imageDetailsOut => _imageDetails.value;
  Stream<String> get navigateToStream => _navigateTo.stream;
  Stream<bool> get showEditDialogStream => _showEditImageDialog.stream;

  bool get isLoadingOut => _isLoading.value;

  Stream<String> get jumpToStream => _jumpTo.stream;
  @override
  void onInit() async {
    _isLoading.value = true;
    _imageListSaved.value = await result.cache.readData('saved');
    _imageListSaved.forEach((element) {
      _imageListSearchedMap.add(element.toMap());
    });
    _isLoading.value = false;
    super.onInit();
  }

  void jumpToPage(String page) {
    _jumpTo.value = page;
  }

  void getImages() async {
    _imageListSaved.clear();
    _imageListSaved.value = await result.cache.readData('saved');
  }
  
  void changeWayViewMode(int value) async {
    _wayViewMode.value = value;
  }

  void validateSearchName(String value) {
    final validationResult = commons.validateName(value);
    _isValidName.value = validationResult['isValidName'];
    _errorTextDialog.value = validationResult['errorTextDialog'];
  }

  void onSubmited(String value) {
    result.repository.getImagesByName(value);
  }

  void clearValues() {
    _imageListSaved.clear();
    _imageListSearchedMap.clear();
  }

  void showGifDetails(Map imageMap) async {
    print('ok');
    _imageDetails.value = ImageModel.fromMap(imageMap);
    _imageDetailsMap.value = _imageDetails.value.toMap();
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

  void showEditDialog() {
    _showEditImageDialog.value = !_showEditImageDialog.value;
  }
}
