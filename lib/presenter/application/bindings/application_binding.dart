import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../model/model.dart';
import './../../presenter.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.put(Cache());
    Get.put(ImageRepository(client: Get.find()));
    Get.put(ImageResults(
      repository: Get.find(),
      cache: Get.find(),
    ));
    Get.lazyPut(() => GetXHomePresenter(result: Get.find()));
    Get.lazyPut(() => GetXSavedPresenter(result: Get.find()));
    Get.lazyPut(() => GetXTrashPresenter(repository: Get.find()));
  }
}
