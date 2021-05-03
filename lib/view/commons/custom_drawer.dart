import 'package:flutter/material.dart';

class CurstomDrawer extends StatelessWidget {
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
                buildDrawerButtonItem('Home'),
                buildDrawerButtonItem('Gifs Salvos'),
                buildDrawerButtonItem('Lixeira'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton buildDrawerButtonItem(String item) {
    return ElevatedButton(
      onPressed: () {},
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
