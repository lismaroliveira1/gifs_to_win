import 'package:flutter/material.dart';

import '../../presenter/presenter.dart';

PopupMenuButton<int> buildPopupMenuButton({@required HomePresenter presenter}) {
  return PopupMenuButton(
      initialValue: presenter.limitImageView,
      onSelected: (value) => presenter.changeTotalPerPage(limit: value),
      itemBuilder: (context) {
        return [
          CheckedPopupMenuItem(
            value: 15,
            checked: presenter.limitImageView == 15,
            child: Text('15 por página'),
          ),
          CheckedPopupMenuItem(
            value: 30,
            checked: presenter.limitImageView == 30,
            child: Text('30 por página'),
          ),
          CheckedPopupMenuItem(
            value: 50,
            checked: presenter.limitImageView == 50,
            child: Text('50 por página'),
          ),
        ];
      });
}
