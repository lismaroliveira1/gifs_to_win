import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import './presenter/presenter.dart';
import './view/view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: makeAppLightTheme(),
      dark: makeAppDarkTheme(),
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => GetMaterialApp(
        title: 'Gipher',
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: ApplicationBinding(),
        initialRoute: '/',
        getPages: [
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
