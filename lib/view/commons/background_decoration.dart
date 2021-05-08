import 'package:flutter/material.dart';

BoxDecoration backgroundDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(35, 45, 72, 1),
        Colors.black12,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}
