import 'package:flutter/material.dart';

SnackBar imageDetailsSnackBar({@required BuildContext context}) => SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(),
      ),
    );
