import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../model/model.dart';
import 'presenter.dart';

class GetXSplashPresenter extends GetxController {
  final ImageResults result;
  final CommonController commons;
  GetXSplashPresenter({
    @required this.result,
    @required this.commons,
  });
  var _navigateTo = RxString('/');

  Stream<String> get navigateToStream => _navigateTo.stream;

  @override
  void onInit() async {
    super.onInit();
  }

  void navigateToPage(String page) {
    _navigateTo.value = page;
  }
}
