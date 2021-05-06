import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../view.dart';
import './commons.dart';

Widget buildImageListView({
  @required Function(Map imageMap) showGifDetails,
  @required Future<void> Function() getMoreImages,
  @required List<Map> imageList,
  @required bool isSearch,
  @required String searchName,
  @required Function closeCallback,
  @required Function editImageTitleDialog,
  @required Function(Map imageMap) moveToBlakiList,
  @required BuildContext context,
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
                          return Card(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                          );
                        },
                        openBuilder: (context, action) {
                          showGifDetails(imageGif);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18.0,
                                  horizontal: 18,
                                ),
                                child: Text(
                                  imageGif['title'],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.itim(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blueGrey[700],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, bottom: 20),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.8,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(imageGif['url']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Nome de Usuário',
                                            style: GoogleFonts.itim(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.blueGrey[700],
                                            ),
                                          ),
                                          Text(
                                            imageGif['username'],
                                            style: GoogleFonts.itim(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.blueGrey[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Classificação',
                                            style: GoogleFonts.itim(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.blueGrey[700],
                                            ),
                                          ),
                                          Text(imageGif['rating']),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Altura',
                                            style: GoogleFonts.itim(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.blueGrey[700],
                                            ),
                                          ),
                                          //Text(imageGif['height'] + "px"),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Largura',
                                            style: GoogleFonts.itim(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.blueGrey[700],
                                            ),
                                          ),
                                          Text(imageGif['width'] + "px"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Tamanho',
                                    style: GoogleFonts.itim(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueGrey[700],
                                    ),
                                  ),
                                  Text(imageGif['size'] + "KB"),
                                ],
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          editImageTitleDialog();
                                        },
                                        child: Text('Editar'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          moveToBlakiList(
                                            imageGif,
                                          );
                                        },
                                        child: Text('Deletar'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text('Salvar'),
                              ),
                            ],
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
