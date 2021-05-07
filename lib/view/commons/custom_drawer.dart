import 'package:google_fonts/google_fonts.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class CurstomDrawer extends StatelessWidget {
  final Function(String route) callback;
  CurstomDrawer(this.callback);
  @override
  Widget build(BuildContext context) {
    double _edge = MediaQuery.of(context).size.width * 0.95;
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: _edge * 0.5,
                  child: Center(
                    child: Container(
                      height: _edge * 0.3,
                      width: _edge * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/eagle_image.gif'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Divider(),
                buildDrawerButtonItem(
                  item: 'Home',
                  callback: callback,
                  context: context,
                  routePage: '/',
                  icon: Icons.home,
                ),
                Divider(),
                buildDrawerButtonItem(
                  item: 'Gifs Salvos',
                  callback: callback,
                  context: context,
                  routePage: '/saved',
                  icon: Icons.save,
                ),
                Divider(),
                buildDrawerButtonItem(
                  item: 'Configurações',
                  callback: callback,
                  context: context,
                  routePage: '/setupPage',
                  icon: Icons.delete,
                ),
                Divider(),
                buildDrawerButtonItem(
                  item: 'Lixeira',
                  callback: callback,
                  context: context,
                  routePage: '/trash',
                  icon: Icons.delete,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrawerButtonItem({
    @required String item,
    @required BuildContext context,
    @required String routePage,
    @required Function callback,
    @required IconData icon,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        Future.delayed(
          Duration(milliseconds: 500),
          callback(routePage),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item,
              style: GoogleFonts.itim(
                fontSize: 24,
              ),
            ),
            Icon(icon)
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerBack() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(35, 45, 72, 1),
              Colors.black12,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );
}
