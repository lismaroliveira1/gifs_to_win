import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presenter/presenter.dart';
import '../view.dart';

class HomePage extends StatelessWidget {
  final GetXHomePresenter presenter;
  HomePage({@required this.presenter});

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState _snackBarContext = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: buildAppBar(context: context, presenter: presenter),
      body: Builder(builder: (context) {
        presenter.navigateToStream.listen((page) {
          if (page?.isNotEmpty == true) {
            Get.toNamed(page);
          }
        });
        return GestureDetector(
          onTap: () {
            hideKeyboard(context: context);
          },
          onLongPress: () {
            hideKeyboard(context: context);
          },
          child: Obx(
            () => Column(
              children: [
                Container(
                  height: 80,
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onTap: () => _snackBarContext.hideCurrentSnackBar(),
                        decoration: InputDecoration(
                          labelText: 'Pesquisar',
                          labelStyle: TextStyle(
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
                buildGridImages(presenter: presenter),
              ],
            ),
          ),
        );
      }),
    );
  }
}
