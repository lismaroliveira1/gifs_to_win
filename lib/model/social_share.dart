import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:social_share/social_share.dart';

class SocialGifShare {
  Future<Map> checkSocialApps() async {
    final response = await SocialShare.checkInstalledAppsForShare();
    return response;
  }

  Future<void> shareByInstagram(Map imageMap) async {
    try {
      var imageId = await ImageDownloader.downloadImage(imageMap['url']);
      if (imageId == null) {
        print(imageId);
        return;
      }
      print(imageId);
      var path = await ImageDownloader.findPath(imageId);
      SocialShare.shareInstagramStory(
        path,
        backgroundTopColor: "#ffffff",
        backgroundBottomColor: "#000000",
        attributionURL: "https://deep-link-url",
      );
    } catch (error) {}
  }

  Future loadAsset(String assetPath) async {
    return await rootBundle.loadString(assetPath);
  }
}
