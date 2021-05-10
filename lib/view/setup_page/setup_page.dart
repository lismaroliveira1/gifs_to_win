import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:get/get.dart';
import 'package:gifs_to_win/i18n/i18n.dart';

import '../../presenter/presenter.dart';
import '../view.dart';

class SetupPage extends StatelessWidget {
  final GetXSetupPresenter presenter;

  SetupPage({@required this.presenter});
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    double _edge = MediaQuery.of(context).size.width;
    return buildCustomDrawer(
      key: _innerDrawerKey,
      rightChild: Container(),
      leftChild: buildLeftChildDrawer(
        edge: _edge,
        routePageCallBack: presenter.jumpToPage,
        context: context,
        reverse: false,
      ),
      scaffold: buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        innerDrawerKey: _innerDrawerKey,
        initialValue: presenter.wayViewModeOut,
        buttonCallback: (value) => presenter.changeWayViewMode(value),
        title: R.translations.setup,
      ),
      body: Builder(
        builder: (context) {
          presenter.navigateToStream.listen((page) {
            if (page?.isNotEmpty == true) {
              Get.toNamed(page);
            }
          });
          presenter.jumpToStream.listen((page) {
            if (page != null) {
              Get.offNamed(page);
            }
          });
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  buildGroupSetupStack(
                    tiles: <Widget>[
                      ListTile(
                        title: Text("Qualidade"),
                        subtitle: Text("Altere a qualidade das imagens no app"),
                        trailing: PopupMenuButton(
                          onSelected: (value) =>
                              presenter.changeImageQuality(value),
                          itemBuilder: (BuildContext context) {
                            return [
                              CheckedPopupMenuItem(
                                value: 1,
                                checked: presenter.imageQualityOut == 1,
                                child: Text('Ótima'),
                              ),
                              CheckedPopupMenuItem(
                                value: 2,
                                checked: presenter.imageQualityOut == 2,
                                child: Text('Muito boa'),
                              ),
                              CheckedPopupMenuItem(
                                value: 3,
                                checked: presenter.imageQualityOut == 3,
                                child: Text('Boa'),
                              ),
                              CheckedPopupMenuItem(
                                value: 4,
                                checked: presenter.imageQualityOut == 4,
                                child: Text('Moderada'),
                              ),
                              CheckedPopupMenuItem(
                                value: 5,
                                checked: presenter.imageQualityOut == 5,
                                child: Text('Baixa'),
                              ),
                              CheckedPopupMenuItem(
                                value: 6,
                                checked: presenter.imageQualityOut == 6,
                                child: Text('Muito baixa'),
                              ),
                            ];
                          },
                          child: Icon(Icons.list),
                        ),
                      ),
                      ListTile(
                        title: Text("Quantidade por página"),
                        subtitle: Text("Altere a qualidade das imagens no app"),
                        trailing: PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return [
                              CheckedPopupMenuItem(
                                value: 1,
                                checked: true,
                                child: Text('Lista'),
                              ),
                              CheckedPopupMenuItem(
                                value: 2,
                                checked: false,
                                child: Text('Grade'),
                              ),
                            ];
                          },
                          child: Icon(Icons.list),
                        ),
                      ),
                    ],
                    groupTitle: 'Gifs e Stickers',
                  ),
                  buildGroupSetupStack(
                    groupTitle: 'Tema',
                    tiles: <Widget>[
                      SwitchListTile(
                        title: Text("Tema escuro"),
                        subtitle: Text("Utilize o tema escuro no aplicativo"),
                        value: true,
                        onChanged: (bool value) {},
                      ),
                      SwitchListTile(
                        title: Text("Tema claro"),
                        subtitle: Text("Utilize o tema escuro no aplicativo"),
                        value: true,
                        onChanged: (bool value) {
                          if (value) {
                          } else {}
                        },
                      ),
                      SwitchListTile(
                        title: Text("Tema do sistema"),
                        subtitle: Text("Utilize o mesmo tema que o sistema"),
                        value: true,
                        onChanged: (bool value) {
                          if (value) {
                          } else {}
                        },
                      ),
                    ],
                  ),
                  buildGroupSetupStack(
                    groupTitle: 'Notificações',
                    tiles: <Widget>[
                      SwitchListTile(
                        title: Text("Ativar todas as notificatificações"),
                        subtitle:
                            Text("Receba notificações em todos os eventos"),
                        value: true,
                        onChanged: (bool value) {},
                      ),
                      SwitchListTile(
                        title: Text("Ativar notificações parcialmente"),
                        subtitle: Text(
                            "Receber notificações apenas nos ultimos eventos"),
                        value: true,
                        onChanged: (bool value) {
                          if (value) {}
                        },
                      ),
                      SwitchListTile(
                        title: Text("Desativar notificações"),
                        subtitle: Text("Não receber notificações"),
                        value: true,
                        onChanged: (bool value) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildGroupSetupStack({
    @required String groupTitle,
    @required List<Widget> tiles,
  }) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(255, 51, 204, 255), width: 1),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            children: tiles,
          ),
        ),
        Positioned(
            left: 20,
            top: 1,
            child: Container(
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              color: Colors.white,
              child: Text(
                groupTitle,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            )),
      ],
    );
  }
}
