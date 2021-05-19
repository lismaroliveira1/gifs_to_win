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
        return;
      }
      var path = await ImageDownloader.findPath(imageId);
      SocialShare.shareInstagramStory(
        path,
        backgroundTopColor: "#ffffff",
        backgroundBottomColor: "#000000",
        attributionURL: "https://deep-link-url",
      );
    } catch (error) {}
  }

  Future<void> shareTwitter(Map imageMap) async {
    SocialShare.shareTwitter('Caption Text',
        url: imageMap['url'], trailingText: 'trailing text');
  }

  Future<void> shareByWhatsApp(Map imageMap) async {
    SocialShare.shareWhatsapp(imageMap['url']);
  }

  Future<void> shareByMessenger(Map imageMap) async {
    SocialShare.shareSms('Message',
        url: imageMap['url'], trailingText: 'trailing');
  }
}
