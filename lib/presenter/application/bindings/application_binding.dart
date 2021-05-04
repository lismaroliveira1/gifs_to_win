import 'package:get/get.dart';
import 'package:http/http.dart';

import './../../presenter.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut(() => GetXHomePresenter(repository: Get.find()));
    Get.lazyPut(() => GetXSavedPresenter(repository: Get.find()));
    Get.lazyPut(() => GetXTrashPresenter(repository: Get.find()));
  }
}
