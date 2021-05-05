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
  var _blackList = <ImageModel>[].obs;
  var _jumpTo = RxString('/');
  var _errorTextDialog = RxString(null);

  List<ImageModel> get imageDeletedListStream => _blackList.toList();
  bool get isValidNameStream => _isValidName.value;
  Stream<String> get jumpToStream => _jumpTo.stream;
  String get errorTextDialogStream => _errorTextDialog.value;

  @override
  void onInit() async {
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
}
