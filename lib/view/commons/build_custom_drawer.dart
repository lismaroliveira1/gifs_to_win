import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildCustomDrawer({
  @required BuildContext context,
  @required Function(int page) routePageCallBack,
  @required Scaffold scaffold,
  @required GlobalKey key,
  @required PageController pageController,
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
      pageController: pageController,
      edge: _edge,
      routePageCallBack: routePageCallBack,
      context: context,
    ),
    rightChild: Material(
      child: Container(
        decoration: backgroundDecoration(),
      ),
    ),
    backgroundDecoration: backgroundDecoration(),
    scaffold: scaffold,
  );
}

Widget buildLeftChildDrawer({
  @required double edge,
  @required Function(int page) routePageCallBack,
  @required BuildContext context,
  @required PageController pageController,
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
                  item: 'Home',
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.home,
                  pageController: pageController,
                  page: 0,
                ),
                Divider(),
                buildDrawerButtonItem(
                  item: 'Salvos',
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.save,
                  page: 1,
                  pageController: pageController,
                ),
                Divider(),
                buildDrawerButtonItem(
                  item: 'Configurações',
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.delete,
                  pageController: pageController,
                  page: 2,
                ),
                Divider(),
                buildDrawerButtonItem(
                  item: 'Lixeira',
                  callback: (page) => routePageCallBack(page),
                  context: context,
                  icon: Icons.delete,
                  pageController: pageController,
                  page: 3,
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
  @required Function(int page) callback,
  @required IconData icon,
  @required PageController pageController,
  @required int page,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
      Future.delayed(
        Duration(milliseconds: 500),
        callback(page),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Row(
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
        ),
      ),
    ),
  );
}
