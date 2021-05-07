import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget builListTileOpenedWidget(
  Map imageGif,
  BuildContext context,
  Function editImageTitleDialog,
  moveToBlakiList(Map imageMap),
  List<Map> listRelatedImagesMap,
) {
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
        padding: const EdgeInsets.only(top: 8.0, bottom: 20),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
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
      SizedBox(
        height: 140,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: listRelatedImagesMap
              .map(
                (image) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: NetworkImage(image['url']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 14.0),
        child: TextButton(
          onPressed: () {},
          child: Text('Share'),
        ),
      )
    ],
  );
}
