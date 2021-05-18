import 'package:get/get.dart';
import 'package:gifs_to_win/presenter/getx_saved_presenter.dart';
import 'package:http/http.dart';

import './../../model/model.dart';

class GifSavedBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => GetXSavedPresenter(result: Get.find(), commons: Get.find()));
  }
}
