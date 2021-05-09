import 'package:gifs_to_win/model/social_share.dart';
import 'package:meta/meta.dart';
import './model.dart';

class ImageResults {
  final ImageRepository repository;
  final Cache cache;
  final SocialGifShare socialGifShare;
  ImageResults({
    @required this.repository,
    @required this.cache,
    @required this.socialGifShare,
  });
}
