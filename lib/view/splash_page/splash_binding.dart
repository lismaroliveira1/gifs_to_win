import 'package:get/get.dart';

import '../../presenter/presenter.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetXSplashPresenter(
          result: Get.find(),
          commons: Get.find(),
        ));
  }
}
