import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

void hideKeyboard({@required BuildContext context}) {
  final currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}
