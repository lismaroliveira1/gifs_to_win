import 'package:flutter/material.dart';

import './components.dart';
import '../../presenter/presenter.dart';

SnackBar imageDetailsSnackBar({
  @required BuildContext context,
  @required String id,
  @required String title,
  @required String url,
  @required HomePresenter presenter,
}) {
  double _edge = MediaQuery.of(context).size.width * 0.6;
  ScaffoldMessengerState _snackBarContext = ScaffoldMessenger.of(context);
  return SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    content: Stack(
      children: [
        Container(
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
        Positioned(
          top: 0,
          right: 2,
          child: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _snackBarContext.hideCurrentSnackBar();
              editImageTitleDialog(
                context: context,
                title: title,
                id: id,
                url: url,
                presenter: presenter,
              );
            },
          ),
        )
      ],
    ),
  );
}
