import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../view.dart';
import './commons.dart';

Widget buildImageListView({
  @required Future<void> Function() getMoreImages,
  @required List<Map> imageList,
  @required bool isSearch,
  @required String searchName,
  @required Function closeCallback,
  @required Function editImageTitleDialog,
  @required Function(Map imageMap) moveToBlakiList,
  @required BuildContext context,
  @required Function(Map imageMap) saveImage,
  @required Function(Map imageMap) deleteImage,
  @required Function(Map imageMap) shareImage,
}) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: LazyLoadScrollView(
      onEndOfPage: () async => getMoreImages(),
      child: ListView(
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
                        hideKeyboard(context: context);
                      },
                      child: OpenContainer(
                        transitionType: ContainerTransitionType.fadeThrough,
                        closedBuilder: (context, action) {
                          return builListTileClosedWidget(imageGif['image']);
                        },
                        openBuilder: (context, action) {
                          List<Map<dynamic, dynamic>> _flag =
                              imageGif['relateds'];
                          return builListTileOpenedWidget(
                            imageGif: imageGif,
                            context: context,
                            editImageTitleDialog: editImageTitleDialog,
                            moveToBlakiList: moveToBlakiList,
                            listRelatedImagesMap: _flag,
                            deleteImage: (imageMap) => deleteImage(imageMap),
                            saveImage: (imageMap) => saveImage(imageMap),
                            shareImage: (imageMap) => shareImage(imageMap),
                          );
                        },
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    ),
  );
}
