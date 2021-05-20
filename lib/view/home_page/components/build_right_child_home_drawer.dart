import 'package:flutter/material.dart';
import 'package:gipher/i18n/resources.dart';
import '../../commons/commons.dart';

Material buildRightChildHomeDrawer({
  @required double edge,
  @required Function(String value) callback,
  @required BuildContext context,
  @required bool reverse,
}) {
  return Material(
    type: MaterialType.transparency,
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
              Expanded(
                child: ListView(
                  children: [
                    Divider(),
                    buildRightDrawerButtonItem(
                      reverse: reverse,
                      item: R.translations.animals,
                      callback: (name) => callback(name),
                      context: context,
                      icon: Icons.home,
                    ),
                    Divider(),
                    buildRightDrawerButtonItem(
                      reverse: reverse,
                      item: R.translations.stickers,
                      callback: (name) => callback(name),
                      context: context,
                      icon: Icons.emoji_emotions,
                    ),
                    Divider(),
                    buildRightDrawerButtonItem(
                      item: R.translations.funny,
                      callback: (name) => callback(name),
                      context: context,
                      icon: Icons.emoji_emotions_outlined,
                      reverse: reverse,
                    ),
                    Divider(),
                    buildRightDrawerButtonItem(
                      item: R.translations.games,
                      callback: (page) => callback(page),
                      context: context,
                      icon: Icons.gamepad,
                      reverse: reverse,
                    ),
                    Divider(),
                    buildRightDrawerButtonItem(
                      item: R.translations.animes,
                      callback: (page) => callback(page),
                      context: context,
                      icon: Icons.person,
                      reverse: reverse,
                    ),
                    Divider(),
                    buildRightDrawerButtonItem(
                      item: R.translations.moveSeriesAndTV,
                      callback: (page) => callback(page),
                      context: context,
                      icon: Icons.movie,
                      reverse: reverse,
                    ),
                    Divider(),
                    buildRightDrawerButtonItem(
                      item: R.translations.sports,
                      callback: (page) => callback(page),
                      context: context,
                      icon: Icons.sports_baseball,
                      reverse: reverse,
                    ),
                    Divider(),
                    buildRightDrawerButtonItem(
                      item: R.translations.science,
                      callback: (page) => callback(page),
                      context: context,
                      icon: Icons.science,
                      reverse: reverse,
                    ),
                    Divider(),
                    buildRightDrawerButtonItem(
                      item: R.translations.politics,
                      callback: (page) => callback(page),
                      context: context,
                      icon: Icons.ac_unit_outlined,
                      reverse: reverse,
                    ),
                    Divider(),
                    buildRightDrawerButtonItem(
                      item: R.translations.nature,
                      callback: (page) => callback(page),
                      context: context,
                      icon: Icons.delete,
                      reverse: reverse,
                    ),
                    Divider(),
                    buildRightDrawerButtonItem(
                      item: R.translations.religion,
                      callback: (page) => callback(page),
                      context: context,
                      icon: Icons.accessibility_sharp,
                      reverse: reverse,
                    ),
                    Divider(),
                    buildRightDrawerButtonItem(
                      item: R.translations.variety,
                      callback: (page) => callback(page),
                      context: context,
                      icon: Icons.view_agenda,
                      reverse: reverse,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
