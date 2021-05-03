import 'package:flutter/material.dart';

import '../../presenter/presenter.dart';
import '../view.dart';

AppBar buildAppBar({
  @required BuildContext context,
  @required GetXHomePresenter presenter,
}) {
  return AppBar(
    backgroundColor: Colors.black,
    centerTitle: true,
    title: Image.network(
      url,
      width: MediaQuery.of(context).size.width * 0.6,
    ),
    actions: [
      buildPopupMenuButton(presenter: presenter),
    ],
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {},
    ),
  );
}
