import 'package:meta/meta.dart';

class ImageModel {
  String id;
  String url;
  String username;
  String title;
  String slug;
  String rating;
  String importDateTime;
  String trendingDateTime;

  ImageModel({
    @required this.id,
    @required this.importDateTime,
    @required this.rating,
    @required this.slug,
    @required this.trendingDateTime,
    @required this.url,
    @required this.username,
    @required this.title,
  });
}
