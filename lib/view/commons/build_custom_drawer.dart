import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

import './commons.dart';

Widget buildCustomDrawer({
  @required Scaffold scaffold,
  @required GlobalKey key,
  @required Widget rightChild,
  @required Widget leftChild,
}) {
  return InnerDrawer(
    key: key,
    onTapClose: true,
    swipe: true,
    colorTransitionScaffold: Colors.black54,
    offset: IDOffset.only(bottom: 0.05, right: 0.0, left: 0.0),
    scale: IDOffset.horizontal(0.8),
    proportionalChildArea: true,
    borderRadius: 50,
    leftAnimationType: InnerDrawerAnimation.static,
    rightAnimationType: InnerDrawerAnimation.quadratic,
    onDragUpdate: (double val, InnerDrawerDirection direction) {},
    innerDrawerCallback: (a) {},
    leftChild: leftChild,
    rightChild: rightChild,
    backgroundDecoration: backgroundDecoration(),
    scaffold: scaffold,
  );
}
