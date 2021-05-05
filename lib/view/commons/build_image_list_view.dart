import 'package:flutter/material.dart';

import './commons.dart';

Widget buildImageListView({
  @required List<Map> imageList,
  @required bool isSearch,
  @required String searchName,
  @required Function closeCallback,
}) {
  return ListView(
    //children: presenter.imageSavedListStream
    children: <Widget>[
      isSearch
          ? builResultInformationSearch(searchName, closeCallback)
          : Container(),
      Column(
        children: imageList
            .map(
              (imageGif) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                imageGif['url'],
                              )),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                imageGif['title'],
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ],
  );
}
