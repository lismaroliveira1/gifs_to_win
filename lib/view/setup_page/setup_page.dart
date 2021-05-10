import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
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
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Qualidade"),
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
                  SwitchListTile(
                    title: Text("Ativar todas as notificatificações"),
                    subtitle: Text("Receba notificações em todos os eventos"),
                    value: true,
                    onChanged: (bool value) {},
                  ),
                  SwitchListTile(
                    title: Text("Ativar notificações parcialmente"),
                    subtitle:
                        Text("Receber notificações apenas nos ultimos eventos"),
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
            ),
          );
        },
      ),
    );
  }
}
