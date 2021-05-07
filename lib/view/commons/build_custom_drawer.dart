import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

Widget buildCustomDrawer({
  @required Scaffold scaffold,
  @required GlobalKey key,
}) {
  return InnerDrawer(
    key: key,
    onTapClose: true, // default false
    swipe: true, // default true
    colorTransitionChild: Colors.red, // default Color.black54
    colorTransitionScaffold: Colors.black54, // default Color.black54

    offset: IDOffset.only(bottom: 0.05, right: 0.0, left: 0.0),

    scale: IDOffset.horizontal(0.8), // set the offset in both directions

    proportionalChildArea: true, // default true
    borderRadius: 50, // default 0
    leftAnimationType: InnerDrawerAnimation.static, // default static
    rightAnimationType: InnerDrawerAnimation.quadratic,
    backgroundDecoration: BoxDecoration(color: Colors.red),

    onDragUpdate: (double val, InnerDrawerDirection direction) {},

    innerDrawerCallback: (a) {},
    leftChild: Container(), // required if rightChild is not set
    rightChild: Container(), // required if leftChild is not set
    scaffold: scaffold,
  );
}
