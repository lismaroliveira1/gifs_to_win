import 'package:gifs_to_win/presenter/presenter.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class CurstomDrawer extends StatelessWidget {
  final GetXHomePresenter presenter;
  CurstomDrawer(this.presenter);
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
                  presenter: presenter,
                  context: context,
                  routePage: '/home',
                ),
                buildDrawerButtonItem(
                  item: 'Gifs Salvos',
                  presenter: presenter,
                  context: context,
                  routePage: '/saved',
                ),
                buildDrawerButtonItem(
                  item: 'Lixeira',
                  presenter: presenter,
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
    @required GetXHomePresenter presenter,
    @required BuildContext context,
    @required String routePage,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
        presenter.jumpToPage(routePage);
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
