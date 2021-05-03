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

  factory ImageModel.fromMap(Map imageMap) {
    return new ImageModel(
      id: imageMap['id'],
      url: imageMap['url'],
      username: imageMap['username'],
      title: imageMap['title'],
      slug: imageMap['slug'],
      rating: imageMap['rating'],
      importDateTime: imageMap['import_date_time'],
      trendingDateTime: imageMap['trending_date_time'],
    );
  }
}
