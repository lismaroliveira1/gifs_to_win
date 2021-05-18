import 'package:get/get.dart';

import '../../model/model.dart';
import '../../presenter/presenter.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetXHomePresenter(
          result: Get.find(),
          commons: Get.find(),
        ));
  }
}
