import 'package:meta/meta.dart';

class ImageModel {
  String id;
  String url;
  String username;
  String title;
  String slug;
  String rating;
  String importDateTime;
  String height;
  String width;
  String size;

  ImageModel({
    @required this.id,
    @required this.importDateTime,
    @required this.rating,
    @required this.slug,
    @required this.url,
    @required this.username,
    @required this.title,
    @required this.height,
    @required this.width,
    @required this.size,
  });

  factory ImageModel.fromMap(Map imageMap) {
    return new ImageModel(
      id: imageMap['id'],
      url: imageMap['url'],
      username: imageMap['username'],
      title: imageMap['title'],
      slug: imageMap['slug'],
      rating: imageMap['rating'],
      importDateTime: imageMap['importDateTime'],
      width: imageMap['width'],
      height: imageMap['height'],
      size: imageMap['size'],
    );
  }
}
