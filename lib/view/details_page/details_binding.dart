import 'package:get/get.dart';

import '../../model/model.dart';
import '../../presenter/presenter.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Cache());
    Get.put(ImageResults(
      repository: Get.find(),
      cache: Get.find(),
    ));
    Get.lazyPut(() => ImageRepository(client: Get.find()));
    Get.lazyPut(
        () => GetXHomePresenter(result: Get.find(), commons: Get.find()));
  }
}
