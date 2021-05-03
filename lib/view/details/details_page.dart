import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import './../../presenter/presenter.dart';

class DetailsPage extends StatelessWidget {
  final GetXHomePresenter presenter;
  DetailsPage({@required this.presenter});
  @override
  Widget build(BuildContext context) {
    double _edge = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (context) {
          return Obx(
            () => SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text(
                        presenter.imageDetailsStream.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: _edge,
                        width: _edge,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage(presenter.imageDetailsStream.url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
