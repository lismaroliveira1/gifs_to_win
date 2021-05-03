import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../presenter/presenter.dart';
import '../../view.dart';

Widget buildGridImages({
  @required HomePresenter presenter,
}) =>
    Expanded(
      child: LazyLoadScrollView(
        onEndOfPage: () => presenter.getMoreImages(),
        child: GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: presenter.imageListStream.length,
          itemBuilder: (context, index) {
            String id = presenter.imageListStream[index].id;
            String title = presenter.imageListStream[index].title;
            String imageUrl = presenter.imageListStream[index].url;
            double edge = MediaQuery.of(context).size.width * 0.4;
            ScaffoldMessengerState _snackBarContext =
                ScaffoldMessenger.of(context);
            return InkWell(
              onTap: () {
                hideKeyboard(context: context);
                _snackBarContext.hideCurrentSnackBar();
                _snackBarContext.showSnackBar(
                  imageSnackBar(
                    context: context,
                    presenter: presenter,
                    id: id,
                    title: title,
                    url: imageUrl,
                  ),
                );
              },
              child: Card(
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
                            image: NetworkImage(imageUrl),
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
              ),
            );
          },
        ),
      ),
    );
