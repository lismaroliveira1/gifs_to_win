import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../model/model.dart';

class GetXSavedPresenter extends GetxController {
  final ImageResults result;
  GetXSavedPresenter({@required this.result});

  var _isValidName = false.obs;
  var _errorTextDialog = RxString(null);
  var _imageListSaved = <ImageModel>[].obs;
  var _jumpTo = RxString('/');

  List<ImageModel> get imageSavedListStream => _imageListSaved.toList();
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
}
