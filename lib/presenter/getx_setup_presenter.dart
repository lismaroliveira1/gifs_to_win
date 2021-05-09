import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../model/model.dart';
import 'presenter.dart';

class GetXSetupPresenter extends GetxController {
  final ImageResults result;
  final CommonController commons;
  GetXSetupPresenter({
    @required this.result,
    @required this.commons,
  });

  var _jumpTo = RxString('/');

  Stream<String> get jumpToStream => _jumpTo.stream;

  @override
  void onInit() async {
    super.onInit();
  }

  void jumpToPage(String page) {
    _jumpTo.value = page;
  }
}
