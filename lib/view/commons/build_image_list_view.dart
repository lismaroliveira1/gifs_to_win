import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import './commons.dart';

Widget buildImageListView({
  @required Function(Map imageMap) showGifDetails,
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
                child: GestureDetector(
                  onTap: () {
                    showGifDetails(imageGif);
                  },
                  child: Card(
                    elevation: 12,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(4),
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
                                  style: GoogleFonts.itim(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
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
              ),
            )
            .toList(),
      ),
    ],
  );
}
