import 'package:flutter/material.dart';
import 'package:gifs_to_win/i18n/i18n.dart';

import './commons.dart';

Widget buildLeftChildDrawer({
  @required double edge,
  @required Function(String page) routePageCallBack,
  @required BuildContext context,
  @required bool reverse,
}) {
  return Material(
    child: Container(
      decoration: backgroundDecoration(),
      child: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  child: Center(
                    child: Container(
                      height: edge * 0.3,
                      width: edge * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/eagle_image.gif'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Divider(),
                buildRightDrawerButtonItem(
                  reverse: true,
                  item: R.translations.home,
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.home,
                  page: '/',
                ),
                Divider(),
                buildRightDrawerButtonItem(
                  reverse: true,
                  item: R.translations.favorites,
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.save,
                  page: '/saved',
                ),
                Divider(),
                buildRightDrawerButtonItem(
                  reverse: true,
                  item: R.translations.setup,
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.delete,
                  page: '/setup',
                ),
                Divider(),
                buildRightDrawerButtonItem(
                  reverse: true,
                  item: R.translations.trash,
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.delete,
                  page: '/trash',
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
