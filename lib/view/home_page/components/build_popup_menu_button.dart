import 'package:flutter/material.dart';

PopupMenuButton<int> buildPopupMenuButton({
  @required Function(int value) callback,
  @required int initialValue,
}) {
  return PopupMenuButton(
      initialValue: initialValue,
      onSelected: (value) => callback(value),
      itemBuilder: (context) {
        return [
          CheckedPopupMenuItem(
            value: 1,
            checked: initialValue == 1,
            child: Text('Lista'),
          ),
          CheckedPopupMenuItem(
            value: 2,
            checked: initialValue == 2,
            child: Text('Grade'),
          ),
        ];
      });
}
