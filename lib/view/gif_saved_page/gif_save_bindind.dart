import 'package:get/get.dart';
import 'package:gipher/presenter/getx_saved_presenter.dart';

class GifSavedBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => GetXSavedPresenter(result: Get.find(), commons: Get.find()));
  }
}
