import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../model/model.dart';
import 'presenter.dart';

class GetXSplashPresenter extends GetxController {
  final ImageResults result;
  final CommonController commons;
  GetXSplashPresenter({
    @required this.result,
    @required this.commons,
  });

  @override
  void onInit() async {
    super.onInit();
  }
}
