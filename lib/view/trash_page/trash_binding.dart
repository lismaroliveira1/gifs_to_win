import 'package:get/get.dart';

import '../../presenter/presenter.dart';

class TrashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetXTrashPresenter(
        result: Get.find(),
        commons: Get.find(),
      ),
    );
  }
}
