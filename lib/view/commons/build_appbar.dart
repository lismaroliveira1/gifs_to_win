import 'package:flutter/material.dart';

import '../view.dart';

AppBar buildAppBar({
  @required BuildContext context,
  @required GlobalKey<ScaffoldState> scaffoldKey,
  @required Function(int value) callback,
  @required int initialValue,
}) {
  return AppBar(
    backgroundColor: Colors.black,
    centerTitle: true,
    title: Image.network(
      url,
      width: MediaQuery.of(context).size.width * 0.6,
    ),
    actions: [
      buildPopupMenuButton(
        callback: callback,
        initialValue: initialValue,
      ),
    ],
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        scaffoldKey.currentState.openDrawer();
      },
    ),
  );
}
