import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../model/model.dart';
import '../../presenter/presenter.dart';

class TrashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut(() => ImageRepository(client: Get.find()));
    Get.lazyPut(() => GetXTrashPresenter(repository: Get.find()));
  }
}
