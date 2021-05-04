import 'package:gifs_to_win/presenter/presenter.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class CurstomDrawer extends StatelessWidget {
  final Function callback;
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
                Center(
                  child: Container(
                    height: _edge * 0.5,
                    width: _edge * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/eagle_image.gif'),
                      ),
                    ),
                  ),
                ),
                buildDrawerButtonItem(
                  item: 'Home',
                  callback: callback,
                  context: context,
                  routePage: '/',
                ),
                buildDrawerButtonItem(
                  item: 'Gifs Salvos',
                  callback: callback,
                  context: context,
                  routePage: '/saved',
                ),
                buildDrawerButtonItem(
                  item: 'Lixeira',
                  callback: callback,
                  context: context,
                  routePage: '/trash',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton buildDrawerButtonItem({
    @required String item,
    @required BuildContext context,
    @required String routePage,
    @required Function callback,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
        Future.delayed(
          Duration(milliseconds: 500),
          callback,
        );
      },
      child: Text(item),
    );
  }

  Widget _buildDrawerBack() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black54,
              Colors.black12,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );
}
