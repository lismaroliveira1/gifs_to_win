import 'dart:convert';
import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gipher/model/cache/cache.dart';
import 'package:path_provider/path_provider.dart';

import './presenter/presenter.dart';
import './view/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cache = Cache();
  await cache.verifyCache();
  final setupMap = await readData('setup');
  runApp(Gipher(setupMap));
}

class Gipher extends StatelessWidget {
  final List<Map> setupMap;
  Gipher(this.setupMap);
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: makeAppLightTheme(),
      dark: makeAppDarkTheme(),
      initial: _themeMode(setupMap[0]['themeMode']),
      builder: (theme, darkTheme) => GetMaterialApp(
        title: 'Gipher',
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: ApplicationBinding(),
        initialRoute: '/splash',
        getPages: [
          GetPage(
            name: '/splash',
            binding: SplashBinding(),
            page: () => SplashPage(presenter: Get.find()),
          ),
          GetPage(
            name: '/',
            binding: HomeBinding(),
            page: () => HomePage(presenter: Get.find()),
          ),
          GetPage(
            name: '/saved',
            binding: GifSavedBindings(),
            page: () => GifSavedPage(presenter: Get.find()),
          ),
          GetPage(
            name: '/trash',
            binding: TrashBinding(),
            page: () => TrashPage(presenter: Get.find()),
          ),
          GetPage(
            name: '/setup',
            binding: SetupBinding(),
            page: () => SetupPage(presenter: Get.find()),
          ),
        ],
      ),
    );
  }
}

AdaptiveThemeMode _themeMode(int mode) {
  AdaptiveThemeMode _themeMode;
  switch (mode) {
    case 1:
      _themeMode = AdaptiveThemeMode.light;
      break;
    case 2:
      _themeMode = AdaptiveThemeMode.dark;
      break;
    case 3:
      _themeMode = AdaptiveThemeMode.system;
      break;
  }
  return _themeMode;
}

Future<List<Map>> readData(String path) async {
  try {
    List<Map> _list = [];
    final pathDirectory = await getApplicationSupportDirectory();
    final localPath = pathDirectory.path;
    final file = new File('$localPath/$path.txt');
    String data = await file.readAsString();
    final _listDynamic = jsonDecode(data);
    _listDynamic.forEach((element) {
      _list.add(element);
    });
    return _list;
  } catch (e) {
    return [];
  }
}
