import 'package:get/get.dart';
import 'package:meta/meta.dart';
import '../model/model.dart';
import './presenter.dart';

class GetXTrashPresenter extends GetxController {
  final ImageResults result;
  final CommonController commons;
  GetXTrashPresenter({
    @required this.result,
    @required this.commons,
  });

  var _isValidName = false.obs;
  var _blackList = <Map>[].obs;
  var _jumpTo = RxString('/');
  var _errorTextDialog = RxString(null);
  var _imageQuality = 1.obs;

  List<Map> get imageDeletedListOut => _blackList.toList();
  bool get isValidNameStream => _isValidName.value;
  Stream<String> get jumpToStream => _jumpTo.stream;
  String get errorTextDialogStream => _errorTextDialog.value;

  @override
  void onInit() async {
    final setup = await result.cache.readData('setup');
    _imageQuality.value = setup[0]['imageQuality'];
    _blackList.clear();
    _blackList.value = await result.cache.readData('deleted');
    super.onInit();
  }

  void jumpToPage(String page) {
    _jumpTo.value = page;
  }

  void changeViewMode(int limit) async {}

  validateSearchName(String value) {
    final validationResult = commons.validateName(value);
    _isValidName.value = validationResult['isValidName'];
    _errorTextDialog.value = validationResult['errorTextDialog'];
  }

  void onSubmited(String value) {
    result.repository.getImagesByName(
      value: value,
      imageQuality: _imageQuality.value,
    );
  }
}
