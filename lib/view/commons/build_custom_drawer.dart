import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import './commons.dart';

Widget buildCustomDrawer({
  @required BuildContext context,
  @required Function(String page) routePageCallBack,
  @required Scaffold scaffold,
  @required GlobalKey key,
}) {
  double _edge = MediaQuery.of(context).size.width;

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
    leftChild: buildLeftChildDrawer(
      edge: _edge,
      routePageCallBack: routePageCallBack,
      context: context,
      reverse: true,
    ),
    rightChild: buildRIghtChildDrawer(
      edge: _edge,
      routePageCallBack: routePageCallBack,
      context: context,
      reverse: false,
    ),
    backgroundDecoration: backgroundDecoration(),
    scaffold: scaffold,
  );
}

Widget buildDrawerButtonItem({
  @required String item,
  @required BuildContext context,
  @required Function(String page) callback,
  @required IconData icon,
  @required String page,
  @required bool reverse,
}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop();
      Future.delayed(
        Duration(milliseconds: 500),
        callback(page),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: reverse
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    item,
                    style: GoogleFonts.itim(
                      fontSize: 14,
                    ),
                  ),
                ),
                Icon(icon)
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon),
                Container(
                  child: Text(
                    item,
                    style: GoogleFonts.itim(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
    ),
  );
}
