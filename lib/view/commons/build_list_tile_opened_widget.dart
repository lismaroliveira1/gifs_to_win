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
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: TextButton(
                onPressed: () {
                  shareByFacebook(imageGif['image']);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/facebook_icon.png'),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: TextButton(
                onPressed: () {
                  shareByInstagram(imageGif['image']);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/instagram_icon.png'),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: TextButton(
                onPressed: () {
                  shareByWhatsApp(imageGif['image']);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/whatsapp_icon.png'),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: TextButton(
                onPressed: () {
                  shareByTwitter(imageGif['image']);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/twitter_icon.png'),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: TextButton(
                onPressed: () {
                  shareByMessenger(imageGif['image']);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/messenger_icon.png'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
