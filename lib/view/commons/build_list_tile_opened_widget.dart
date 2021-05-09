import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../i18n/i18n.dart';

Widget builListTileOpenedWidget({
  @required Map imageGif,
  @required BuildContext context,
  @required Function editImageTitleDialog,
  @required moveToBlakiList(Map imageMap),
  @required List<Map> listRelatedImagesMap,
  @required Function(Map imageMap) saveImage,
  @required Function(Map imageMap) deleteImage,
  @required Function(Map imageMap) shareImage,
  @required Function(Map imageMap) shareByFacebook,
  @required Function(Map imageMap) shareByInstagram,
  @required Function(Map imageMap) shareByWhatsApp,
  @required Function(Map imageMap) shareByTwitter,
  @required Function(Map imageMap) shareByMessenger,
  @required Map appsInstalleds,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 18,
        ),
        child: Text(
          imageGif['image']['title'],
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
              image: NetworkImage(imageGif['image']['url']),
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
      Row(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              shareByFacebook(imageGif['image']);
            },
            child: Text('Facebook'),
          ),
          ElevatedButton(
            onPressed: () {
              shareByInstagram(imageGif['image']);
            },
            child: Text('Instagram'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Wahtsapp'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Twitter'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Messenger'),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextButton(
              onPressed: () {
                saveImage(imageGif['image']);
              },
              child: Text(R.translations.save),
            ),
            TextButton(
              onPressed: () {},
              child: Text(R.translations.share),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 14.0),
        child: TextButton(
          onPressed: () {},
          child: Text(R.translations.delete),
        ),
      )
    ],
  );
}
