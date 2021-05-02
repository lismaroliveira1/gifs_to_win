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
          buildPopupMenuButton(),
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
              _createGridImages(presenter: presenter),
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuButton<int> buildPopupMenuButton() {
    return PopupMenuButton(
        initialValue: presenter.limitImageView,
        onSelected: (value) => presenter.changeTotalPerPage(limit: value),
        itemBuilder: (context) {
          return [
            CheckedPopupMenuItem(
              value: 15,
              checked: presenter.limitImageView == 15,
              child: Text('15 por página'),
            ),
            CheckedPopupMenuItem(
              value: 30,
              checked: presenter.limitImageView == 30,
              child: Text('30 por página'),
            ),
            CheckedPopupMenuItem(
              value: 50,
              checked: presenter.limitImageView == 50,
              child: Text('50 por página'),
            ),
          ];
        });
  }

  Widget _createGridImages({@required HomePresenter presenter}) => Expanded(
        child: LazyLoadScrollView(
          onEndOfPage: () => presenter.getMoreImages(),
          child: GridView.builder(
            padding: EdgeInsets.all(10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: presenter.imageListStream.length,
            itemBuilder: (context, index) {
              double edge = MediaQuery.of(context).size.width * 0.4;
              return InkWell(
                onTap: () {
                  hideKeyboard(context: context);
                },
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: edge * 0.95,
                          width: edge * 0.95,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  presenter.imageListStream[index].url),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: edge,
                        height: 15,
                        child: Text(
                          presenter.imageListStream[index].title,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
}
