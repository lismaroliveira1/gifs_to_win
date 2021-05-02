import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './environment.dart';

import '../../presenter/presenter.dart';

class HomePage extends StatelessWidget {
  final HomePresenter presenter;
  HomePage({@required this.presenter});
  @override
  Widget build(BuildContext context) {
    void _hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(url),
      ),
      body: GestureDetector(
        onTap: _hideKeyboard,
        child: Obx(
          () => Column(
            children: [
              Container(
                height: 80,
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Pesquisar',
                        labelStyle: TextStyle(
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              _createGridImages(presenter: presenter),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createGridImages({@required HomePresenter presenter}) => Expanded(
        child: GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: presenter.imageListStream.length,
          itemBuilder: (context, index) {
            double edge = MediaQuery.of(context).size.width * 0.4;
            return Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: edge * 0.95,
                      width: edge * 0.95,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              presenter.imageListStream[index].url),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: edge,
                    height: 15,
                    child: Text(
                      presenter.imageListStream[index].title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
