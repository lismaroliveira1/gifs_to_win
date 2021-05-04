import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../view.dart';

Widget buildGridImages({
  @required Function(Map imageMap) showGifDetails,
  @required Future<void> Function() getMoreImages,
  @required List<Map> imageList,
}) =>
    Expanded(
      child: LazyLoadScrollView(
        onEndOfPage: () => getMoreImages,
        //onEndOfPage: () => presenter.getMoreImages(),
        child: GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            print("ok");
            double edge = MediaQuery.of(context).size.width * 0.4;
            ScaffoldMessengerState _snackBarContext =
                ScaffoldMessenger.of(context);
            return InkWell(
              onTap: () {
                hideKeyboard(context: context);
                _snackBarContext.hideCurrentSnackBar();
                showGifDetails(imageList[index]);
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
                            image: NetworkImage(imageList[index]['url']),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: edge,
                      height: 15,
                      child: Text(
                        imageList[index]['title'],
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
