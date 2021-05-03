import 'package:get/get.dart';
import 'package:gifs_to_win/models/model.dart';
import 'package:gifs_to_win/presenter/getx_saved_presenter.dart';

class GifSavedBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageRepository(client: Get.find()));
    Get.lazyPut(() => GetXSavedPresenter(repository: Get.find()));
  }
}
