import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:gifs_to_win/presenter/presenter.dart';

import '../view.dart';

class SetupPage extends StatelessWidget {
  final GetXSetupPresenter presenter;
  SetupPage({@required this.presenter});
  final GlobalKey<InnerDrawerState> innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return buildCustomDrawer(
      key: innerDrawerKey,
      scaffold: Scaffold(
        body: Container(),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              innerDrawerKey.currentState
                  .toggle(direction: InnerDrawerDirection.start);
            },
          ),
        ),
      ),
      context: context,
      routePageCallBack: (String page) {},
    );
  }
}
