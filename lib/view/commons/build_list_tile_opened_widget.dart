import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './commons.dart';

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
  return SafeArea(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'Voce pode tambem gostar de: ',
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: listRelatedImagesMap
                .map(
                  (image) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 150,
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
              buildOpenedContainerButton(
                callback: (imageMap) => shareByFacebook(imageMap),
                imageGif: imageGif['image'],
                iconAsset: 'assets/facebook_icon.png',
              ),
              buildOpenedContainerButton(
                callback: (imageMap) => shareByInstagram(imageMap),
                imageGif: imageGif['image'],
                iconAsset: 'assets/instagram_icon.png',
              ),
              buildOpenedContainerButton(
                callback: (imageMap) => shareByWhatsApp(imageMap),
                imageGif: imageGif['image'],
                iconAsset: 'assets/whatsapp_icon.png',
              ),
              buildOpenedContainerButton(
                callback: (imageMap) => shareByTwitter(imageMap),
                imageGif: imageGif['image'],
                iconAsset: 'assets/twitter_icon.png',
              ),
              buildOpenedContainerButton(
                callback: (imageMap) => shareByMessenger(imageMap),
                imageGif: imageGif['image'],
                iconAsset: 'assets/messenger_icon.png',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildOpenedContainerButton(
                callback: (imageMap) => saveImage(imageMap),
                imageGif: imageGif,
                iconAsset: 'assets/diskette_icon.png',
              ),
              buildOpenedContainerButton(
                callback: (imageMap) async {
                  await deleteImage(imageMap);
                  Navigator.pop(context);
                },
                imageGif: imageGif,
                iconAsset: 'assets/delete_icon.png',
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
