import 'package:flutter/material.dart';
import 'package:gifs_to_win/i18n/resources.dart';
import '../../commons/commons.dart';

Material buildRightChildHomeDrawer({
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
                buildDrawerButtonItem(
                  reverse: reverse,
                  item: R.translations.animals,
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.home,
                  page: 'home',
                ),
                Divider(),
                buildDrawerButtonItem(
                  reverse: reverse,
                  item: R.translations.stickers,
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.save,
                  page: 'saved',
                ),
                Divider(),
                buildDrawerButtonItem(
                  item: 'Configurações',
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.delete,
                  page: '/setup',
                  reverse: reverse,
                ),
                Divider(),
                buildDrawerButtonItem(
                  item: 'Lixeira',
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.delete,
                  page: 'deleted',
                  reverse: reverse,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
