import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../view.dart';
import './../../presenter/presenter.dart';

class DetailsPage extends StatelessWidget {
  final GetXHomePresenter presenter;
  DetailsPage({@required this.presenter});
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double _edge = MediaQuery.of(context).size.width;
    hideKeyboard(context: context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(
        context: context,
        scaffoldKey: _scaffoldKey,
        initialValue: 1,
        buttonCallback: presenter.changeWayViewMode,
      ),
      drawer: CurstomDrawer(presenter.jumpToPage),
      body: Builder(
        builder: (context) {
          return Obx(
            () => SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text(
                        presenter.imageDetailsStream.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: _edge,
                        width: _edge,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage(presenter.imageDetailsStream.url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text('Nome de Usuário'),
                                Text(presenter.imageDetailsStream.username),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text('Classificação'),
                                Text(presenter.imageDetailsStream.rating),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text('Altura'),
                                Text(
                                    presenter.imageDetailsStream.height + "px"),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text('Largura'),
                                Text(presenter.imageDetailsStream.width + "px"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text('Tamanho'),
                        Text(presenter.imageDetailsStream.size + "KB"),
                      ],
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                editImageTitleDialog(
                                  context: context,
                                  presenter: presenter,
                                );
                              },
                              child: Text('Editar'),
                            ),
                            TextButton(
                              onPressed: () {
                                presenter.moveToBlakiList(
                                  id: presenter.imageDetailsStream.id,
                                  title: presenter.imageDetailsStream.title,
                                  url: presenter.imageDetailsStream.url,
                                );
                              },
                              child: Text('Deletar'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Salvar'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
