import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget builListTileClosedWidget(Map imageGif) {
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
  );
}
