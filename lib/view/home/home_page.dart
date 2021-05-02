import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../view.dart';
import './environment.dart';
import '../../presenter/presenter.dart';

class HomePage extends StatelessWidget {
  final HomePresenter presenter;
  HomePage({@required this.presenter});

  final GlobalKey _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState _snackBarContext = ScaffoldMessenger.of(context);

    void _hideSnackBar() {
      if (_snackBarContext.mounted) {
        _snackBarContext.hideCurrentSnackBar();
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.network(
          url,
          width: MediaQuery.of(context).size.width * 0.6,
        ),
        actions: [
          buildPopupMenuButton(presenter: presenter),
        ],
      ),
      body: GestureDetector(
        onTap: () {
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
      ),
    );
  }
}
