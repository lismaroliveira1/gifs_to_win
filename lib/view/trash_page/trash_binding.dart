import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../presenter/presenter.dart';
import '../../model/model.dart';

class TrashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut(() => ImageRepository(client: Get.find()));
    Get.put(ImageResults(
      repository: Get.find(),
      cache: Get.find(),
    ));
    Get.lazyPut(() => GetXTrashPresenter(result: Get.find()));
  }
}
