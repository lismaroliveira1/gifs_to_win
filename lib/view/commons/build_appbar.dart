import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

import '../view.dart';

AppBar buildAppBar({
  @required BuildContext context,
  @required GlobalKey<InnerDrawerState> innerDrawerKey,
  @required Function(int value) buttonCallback,
  @required int initialValue,
  @required String title,
}) {
  return AppBar(
    centerTitle: true,
    elevation: 8,
    title: Text(title),
    actions: [
      buildPopupMenuButton(
        callback: buttonCallback,
        initialValue: initialValue,
      ),
    ],
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        innerDrawerKey.currentState
            .toggle(direction: InnerDrawerDirection.start);
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
