import 'dart:convert';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../model/model.dart';
import './presenter.dart';

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
  var _themeMode = 1.obs;
  var _notificationMode = 1.obs;

  Stream<String> get jumpToStream => _jumpTo.stream;
  int get wayViewModeOut => _wayViewMode.toInt();
  Stream<String> get navigateToStream => _navigateTo.stream;
  int get imageQualityOut => _imageQuality.toInt();
  int get imagePerPageOut => _imagePerPage.toInt();
  int get themeModeOUt => _themeMode.toInt();
  int get notificationModeOut => _notificationMode.toInt();

  @override
  void onInit() async {
    final setup = await result.cache.readData('setup');
    _imageQuality.value = setup[0]['imageQuality'];
    _imagePerPage.value = setup[0]['imagePerPage'];
    _themeMode.value = setup[0]['themeMode'];
    super.onInit();
  }

  void jumpToPage(String page) {
    _jumpTo.value = page;
  }

  void changeWayViewMode(int value) async {
    _wayViewMode.value = value;
  }

  void changeImageQuality(int value) async {
    await writeFileStorage('imageQuality', value);
    _imageQuality.value = value;
  }

  void changeImagesPerPage(int value) async {
    await writeFileStorage('imagePerPage', value);
    _imagePerPage.value = value;
  }

  void changeAppTheme(
      {@required int mode, @required BuildContext context}) async {
    _themeMode.value = mode;
    switch (mode) {
      case 1:
        AdaptiveTheme.of(context).setDark();
        break;
      case 2:
        AdaptiveTheme.of(context).setLight();
        break;
      case 3:
        AdaptiveTheme.of(context).setSystem();
        break;
    }
    await writeFileStorage('themeMode', mode);
    _themeMode.value = mode;
  }

  void changeNotificationMode(int mode) async {
    await writeFileStorage('notificationMode', mode);
    _notificationMode.value = mode;
  }

  Future<void> writeFileStorage(String key, dynamic value) async {
    var setup = await result.cache.readData('setup');
    setup[0][key] = value;
    await result.cache.writeData(jsonEncode(setup), path: 'setup');
  }
}
