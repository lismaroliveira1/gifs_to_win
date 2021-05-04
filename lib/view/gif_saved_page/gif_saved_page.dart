import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gifs_to_win/presenter/getx_saved_presenter.dart';

class GifSavedPage extends StatelessWidget {
  final GetXSavedPresenter presenter;
  GifSavedPage({@required this.presenter});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState _snackBarContext = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      body: Obx(
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
            Expanded(
              child: ListView(
                children: presenter.imageSavedListStream
                    .map((e) => ListTile())
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
