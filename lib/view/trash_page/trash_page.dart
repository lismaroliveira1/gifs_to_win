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
          return Obx(
            () => Column(
              children: [
                Container(
                  height: 80,
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
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
