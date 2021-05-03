import 'package:flutter/material.dart';

SnackBar imageDetailsSnackBar({
  @required BuildContext context,
  @required String id,
  @required String title,
  @required String url,
}) {
  double _edge = MediaQuery.of(context).size.width * 0.8;
  return SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    content: Container(
      height: MediaQuery.of(context).size.height * 0.55,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: _edge,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: _edge,
              width: _edge,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(url),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Cancelar',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
