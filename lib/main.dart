import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './presenter/presenter.dart';
import './view/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          binding: HomeBinding(),
          page: () => HomePage(presenter: Get.find()),
        ),
        GetPage(
          name: '/details',
          binding: HomeBinding(),
          page: () => DetailsPage(),
        ),
      ],
    );
  }
}
