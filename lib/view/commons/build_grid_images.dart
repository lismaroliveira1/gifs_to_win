import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../view.dart';

Widget buildGridImages({
  @required Function(Map imageMap) showGifDetails,
  @required Future<void> Function() getMoreImages,
  @required List<Map> imageList,
  @required bool isSearch,
  @required String searchName,
  @required Function closeCallback,
  @required Function editImageTitleDialog,
  @required Function(Map imageMap) moveToBlakiList,
  @required Function(Map imageMap) saveImage,
  @required Function(Map imageMap) deleteImage,
  @required Function(Map imageMap) shareImage,
  @required Map appsInstalleds,
  @required Function shareByFacebook,
  @required Function shareByInstagram,
  @required Function shareByWhatsApp,
  @required Function shareByTwitter,
  @required Function shareByMessenger,
}) =>
    Expanded(
      child: LazyLoadScrollView(
        onEndOfPage: () async => getMoreImages(),
        child: Column(
          children: [
            isSearch
                ? builResultInformationSearch(searchName, closeCallback)
                : Container(),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  print(imageList[index]);
                  double edge = MediaQuery.of(context).size.width * 0.4;
                  ScaffoldMessengerState _snackBarContext =
                      ScaffoldMessenger.of(context);
                  return InkWell(
                      onTap: () {
                        hideKeyboard(context: context);
                        _snackBarContext.hideCurrentSnackBar();
                        showGifDetails(imageList[index]);
                      },
                      child: OpenContainer(
                        closedBuilder: (context, action) =>
                            buildClosedImageGridTile(edge, imageList, index),
                        openBuilder: (context, action) {
                          List<Map<dynamic, dynamic>> _flag =
                              imageList[index]['relateds'];
                          return builListTileOpenedWidget(
                            imageGif: imageList[index],
                            context: context,
                            editImageTitleDialog: editImageTitleDialog,
                            moveToBlakiList: moveToBlakiList,
                            listRelatedImagesMap: _flag,
                            deleteImage: (imageMap) => deleteImage(imageMap),
                            saveImage: (imageMap) => saveImage(imageMap),
                            shareImage: (imageMap) => shareImage(imageMap),
                            appsInstalleds: appsInstalleds,
                            shareByFacebook: (imageMap) =>
                                shareByFacebook(imageMap),
                            shareByInstagram: (imageMap) =>
                                shareByInstagram(imageMap),
                            shareByWhatsApp: (imageMap) =>
                                shareByWhatsApp(imageMap),
                            shareByTwitter: (imageMap) =>
                                shareByTwitter(imageMap),
                            shareByMessenger: (imageMap) =>
                                shareByMessenger(imageMap),
                          );
                        },
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );


