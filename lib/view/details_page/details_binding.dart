import 'package:get/get.dart';

import '../../model/model.dart';
import '../../presenter/presenter.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageRepository(client: Get.find()));
    Get.lazyPut(() => GetXHomePresenter(repository: Get.find()));
  }
}
