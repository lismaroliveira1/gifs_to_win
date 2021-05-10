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

  var _navigateTo = RxString('/');
  var _jumpTo = RxString('/');
  var _wayViewMode = 1.obs;

  Stream<String> get jumpToStream => _jumpTo.stream;
  int get wayViewModeOut => _wayViewMode.toInt();
  Stream<String> get navigateToStream => _navigateTo.stream;

  @override
  void onInit() async {
    super.onInit();
  }

  void jumpToPage(String page) {
    _jumpTo.value = page;
  }

  void changeWayViewMode(int value) async {
    _wayViewMode.value = value;
  }
}
