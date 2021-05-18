import 'package:get/get.dart';

import '../../model/model.dart';
import '../../presenter/presenter.dart';

class SetupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => GetXSetupPresenter(result: Get.find(), commons: Get.find()));
  }
}
