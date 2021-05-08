import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

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

Material buildRIghtChildDrawer({
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
                  item: 'Home',
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.home,
                  page: 'home',
                ),
                Divider(),
                buildDrawerButtonItem(
                  reverse: reverse,
                  item: 'Salvos',
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
                buildDrawerButtonItem(
                  reverse: true,
                  item: 'Home',
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.home,
                  page: '/',
                ),
                Divider(),
                buildDrawerButtonItem(
                  reverse: true,
                  item: 'Salvos',
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.save,
                  page: '/saved',
                ),
                Divider(),
                buildDrawerButtonItem(
                  reverse: true,
                  item: 'Configurações',
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.delete,
                  page: '/setup',
                ),
                Divider(),
                buildDrawerButtonItem(
                  reverse: true,
                  item: 'Lixeira',
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
      print('ok');
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
