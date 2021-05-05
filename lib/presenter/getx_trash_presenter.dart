import 'package:get/get.dart';
import 'package:meta/meta.dart';
import '../model/model.dart';

class GetXTrashPresenter extends GetxController {
  final ImageResults result;
  GetXTrashPresenter({@required this.result});

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
