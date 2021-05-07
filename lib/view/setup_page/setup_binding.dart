import 'package:get/get.dart';

import '../../model/model.dart';
import '../../presenter/presenter.dart';

class SetupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Cache());
    Get.put(ImageResults(
      repository: Get.find(),
      cache: Get.find(),
    ));
    Get.lazyPut(() => ImageRepository(client: Get.find()));
    Get.lazyPut(
        () => GetXSetupPresenter(result: Get.find(), commons: Get.find()));
  }
}
