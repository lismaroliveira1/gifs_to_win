import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './presenter/presenter.dart';
import './view/view.dart';
import './view/details_page/details_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: makeAppTheme(),
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
          name: '/details',
          binding: DetailsBinding(),
          page: () => DetailsPage(presenter: Get.find()),
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
      ],
    );
  }
}
