import 'package:get/get.dart';

import '../../models/model.dart';
import '../../presenter/presenter.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageRepository(client: Get.find()));
    Get.lazyPut(() => HomePresenter(repository: Get.find()));
  }
}
