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

  var _isValidName = false.obs;
  var _errorTextDialog = RxString(null);
  var _imageListSaved = <ImageModel>[].obs;
  var _jumpTo = RxString('/');

  List<ImageModel> get imageSavedListStream => _imageListSaved.toList();
  String get errorTextDialogStream => _errorTextDialog.value;

  Stream<String> get jumpToStream => _jumpTo.stream;
  @override
  void onInit() async {
    _imageListSaved.clear();
    _imageListSaved.value = await result.cache.readData('saved');
    super.onInit();
  }

  void jumpToPage(String page) {
    _jumpTo.value = page;
  }

  void getImages() async {
    _imageListSaved.clear();
    _imageListSaved.value = await result.cache.readData('saved');
  }

  void changeViewMode(int limit) async {}

  void validateSearchName(String value) {
    final validationResult = commons.validateName(value);
    _isValidName.value = validationResult['isValidName'];
    _errorTextDialog.value = validationResult['errorTextDialog'];
  }

  void onSubmited(String value) {
    result.repository.getImagesByName(value);
  }
}
