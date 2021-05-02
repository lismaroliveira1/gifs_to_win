import 'package:flutter/material.dart';

import '../../presenter/presenter.dart';

SnackBar imageSnackBar(
    {@required BuildContext context, @required HomePresenter presenter}) {
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
