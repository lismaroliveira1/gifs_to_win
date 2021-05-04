import 'package:get/get.dart';
import 'package:gifs_to_win/presenter/getx_saved_presenter.dart';
import 'package:http/http.dart';

import './../../model/model.dart';

class GifSavedBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut(() => ImageRepository(client: Get.find()));
    Get.lazyPut(() => GetXSavedPresenter(repository: Get.find()));
  }
}
