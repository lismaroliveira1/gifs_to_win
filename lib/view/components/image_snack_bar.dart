import 'package:flutter/material.dart';

SnackBar imageSnackBar() {
  return SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    content: Container(
      height: 80,
    ),
  );
}
