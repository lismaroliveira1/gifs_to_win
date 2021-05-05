import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifs_to_win/presenter/getx_trash_presenter.dart';

import '../view.dart';

class TrashPage extends StatelessWidget {
  final GetXTrashPresenter presenter;
  TrashPage({@required this.presenter});
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
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
                  child: buildImageListView(presenter.imageDeletedListStream),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
