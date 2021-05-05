import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gifs_to_win/presenter/getx_saved_presenter.dart';

import '../view.dart';

class GifSavedPage extends StatelessWidget {
  final GetXSavedPresenter presenter;
  GifSavedPage({@required this.presenter});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(
        context: context,
        scaffoldKey: _scaffoldKey,
        initialValue: 1,
        buttonCallback: presenter.changeViewMode,
      ),
      drawer: CurstomDrawer(presenter.jumpToPage),
      body: Builder(
        builder: (context) {
          presenter.jumpToStream.listen((page) {
            if (page?.isNotEmpty == true) {
              Get.offAllNamed(page);
            }
          });
          return Obx(
            () => Column(
              children: [
                buildForm(onChanged: presenter.validateName),
                Expanded(
                  child: buildImageListView(presenter.imageSavedListStream),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
