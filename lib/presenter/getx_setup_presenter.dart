import 'dart:convert';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../model/model.dart';
import 'presenter.dart';

class GetXSetupPresenter extends GetxController {
  final ImageResults result;
  final CommonController commons;
  GetXSetupPresenter({
    @required this.result,
    @required this.commons,
  });

  var _navigateTo = RxString('/');
  var _jumpTo = RxString('/');
  var _wayViewMode = 1.obs;
  var _imageQuality = RxInt(1);
  var _imagePerPage = RxInt(30);

  Stream<String> get jumpToStream => _jumpTo.stream;
  int get wayViewModeOut => _wayViewMode.toInt();
  Stream<String> get navigateToStream => _navigateTo.stream;
  int get imageQualityOut => _imageQuality.toInt();
  int get imagePerPageOut => _imagePerPage.toInt();

  @override
  void onInit() async {
    final setup = await result.cache.readData('setup');
    _imageQuality.value = setup[0]['imageQuality'];
    _imagePerPage.value = setup[0]['imagePerPage'];
    super.onInit();
  }

  void jumpToPage(String page) {
    _jumpTo.value = page;
  }

  void changeWayViewMode(int value) async {
    _wayViewMode.value = value;
  }

  void changeImageQuality(int value) async {
    var setup = await result.cache.readData('setup');
    setup[0]['imageQuality'] = value;
    result.cache.writeData(jsonEncode(setup), path: 'setup');
    print(value);
  }

  void changeImagesPerPage(int value) async {
    var setup = await result.cache.readData('setup');
    setup[0]['imagePerPage'] = value;
    _imagePerPage.value = value;
    await result.cache.writeData(jsonEncode(setup), path: 'setup');
  }
}
