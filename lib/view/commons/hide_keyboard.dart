import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

bool hideKeyboard({@required BuildContext context}) {
  final currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
  return !currentFocus.hasPrimaryFocus;
}
