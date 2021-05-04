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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      drawer: CurstomDrawer(presenter.jumpToPage),
      body: Builder(
        builder: (context) {
          presenter.jumpToStream.listen((page) {
            if (page?.isNotEmpty == true) {
              Get.offAllNamed(page);
            }
          });
          return Container();
        },
      ),
    );
  }
}
