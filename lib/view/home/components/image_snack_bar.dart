import 'package:flutter/material.dart';

import '../../../presenter/presenter.dart';
import '../../view.dart';

SnackBar imageSnackBar({
  @required BuildContext context,
  @required GetXHomePresenter presenter,
  @required String id,
  @required String title,
  @required String url,
}) {
  ScaffoldMessengerState _snackBarContext = ScaffoldMessenger.of(context);
  return SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    content: Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _snackBarContext.hideCurrentSnackBar();
              _snackBarContext.showSnackBar(
                imageDetailsSnackBar(
                  presenter: presenter,
                  context: context,
                  id: id,
                  title: title,
                  url: url,
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _snackBarContext.hideCurrentSnackBar();
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _snackBarContext.hideCurrentSnackBar();
            },
          ),
        ],
      ),
    ),
  );
}
