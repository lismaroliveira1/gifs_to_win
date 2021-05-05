import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../view.dart';

Widget buildGridImages({
  @required Function(Map imageMap) showGifDetails,
  @required Future<void> Function() getMoreImages,
  @required List<Map> imageList,
  @required bool isSearch,
  @required String searchName,
  @required Function closeCallback,
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
                      elevation: 12,
                      child: Center(
                        child: Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Container(
                                  height: edge * 0.85,
                                  width: edge * 0.85,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          NetworkImage(imageList[index]['url']),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                imageList[index]['title'],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.itim(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                ),
                                overflow: TextOverflow.fade,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
