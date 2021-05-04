import 'package:flutter/material.dart';

ListView buildImageListView(List imageList) {
  return ListView(
    //children: presenter.imageSavedListStream
    children: imageList
        .map(
          (imageGif) => Padding(
            padding: const EdgeInsets.all(8.0),
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
                      image: NetworkImage(imageGif.url),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        imageGif.title,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
        .toList(),
  );
}
