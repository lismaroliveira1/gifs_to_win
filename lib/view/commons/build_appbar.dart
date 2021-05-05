import 'package:flutter/material.dart';

import '../view.dart';

AppBar buildAppBar({
  @required BuildContext context,
  @required GlobalKey<ScaffoldState> scaffoldKey,
  @required Function(int value) buttonCallback,
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
        callback: buttonCallback,
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

class BuildAppBar extends StatelessWidget {
  final BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Function(int value) buttonCallback;
  final int initialValue;

  const BuildAppBar(
      {Key key,
      this.context,
      this.scaffoldKey,
      this.buttonCallback,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Image.network(
        url,
        width: MediaQuery.of(context).size.width * 0.6,
      ),
      actions: [
        buildPopupMenuButton(
          callback: buttonCallback,
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
}
