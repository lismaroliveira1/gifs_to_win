import 'package:get/get.dart';
import 'package:gifs_to_win/model/social_share.dart';
import 'package:gifs_to_win/presenter/getx_saved_presenter.dart';
import 'package:http/http.dart';
import 'package:social_share/social_share.dart';

import './../../model/model.dart';

class GifSavedBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());

    Get.put(Cache());
    Get.put(ImageResults(
      repository: Get.find(),
      socialGifShare: Get.find(),
      cache: Get.find(),
    ));
    Get.lazyPut(() => ImageRepository(client: Get.find()));
    Get.lazyPut(
        () => GetXSavedPresenter(result: Get.find(), commons: Get.find()));
  }
}
