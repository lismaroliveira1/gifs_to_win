import 'dart:convert';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../model/model.dart';
import './commons/commons.dart';

class GetXHomePresenter extends GetxController {
  final ImageRepository repository;

  GetXHomePresenter({
    @required this.repository,
  });

  var _navigateTo = RxString('/');
  var _jumpTo = RxString('/');
  var _imageList = <ImageModel>[].obs;
  var _imageListRelated = <ImageModel>[].obs;
  var _imageDetails = Rx<ImageModel>(null);
  var _imageListSaved = <dynamic>[].obs;
  var _defaultLimit = 15.obs;
  var _defaultOffset = 1.obs;
  var _isValidName = false.obs;
  var _errorTextDialog = RxString(null);

  List<ImageModel> get imageListStream => _imageList.toList();
  ImageModel get imageDetailsStream => _imageDetails.value;
  List<ImageModel> get imageListRelatedStream => _imageListRelated.toList();
  Stream<String> get navigateToStream => _navigateTo.stream;
  Stream<String> get jumpToStream => _jumpTo.stream;
  String get errorTextDialogStream => _errorTextDialog.value;
  int get limitImageView => _defaultLimit.toInt();
  bool get isValidNameStream => _isValidName.value;
  @override
  void onInit() async {
    _navigateTo.value = '';
    var listSavedCache = await readData('saved');
    _imageListSaved.value = jsonDecode(listSavedCache);
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

  void showGifDetails({@required Map imageMap}) async {
    _imageDetails.value = ImageModel.fromMap(imageMap);
    Future.delayed(Duration(milliseconds: 250), () {
      _navigateTo.value = '';
      _navigateTo.value = '/details';
    });
    _imageListRelated.value =
        await repository.getImagesByName(imageMap['username']);
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
    await writeData(jsonEncode(_imageListSaved), path: 'saved');
    print(_imageListSaved.length);
  }

  void validateName(String value) {
    print(value);
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
}
