import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:get/get.dart';

import '../../presenter/presenter.dart';
import '../view.dart';

class SetupPage extends StatelessWidget {
  final GetXSetupPresenter presenter;
  SetupPage({@required this.presenter});
  final GlobalKey<InnerDrawerState> innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    double _edge = MediaQuery.of(context).size.width;
    return buildCustomDrawer(
      key: innerDrawerKey,
      rightChild: Container(),
      leftChild: buildLeftChildDrawer(
        edge: _edge,
        routePageCallBack: presenter.jumpToPage,
        context: context,
        reverse: false,
      ),
      scaffold: buildScaffold(),
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              innerDrawerKey.currentState
                  .toggle(direction: InnerDrawerDirection.start);
            },
          ),
        ),
        body: Builder(
          builder: (context) {
            presenter.jumpToStream.listen((page) {
              if (page != null) {
                Get.offNamed(page);
              }
            });
            return Container();
          },
        ));
  }
}
