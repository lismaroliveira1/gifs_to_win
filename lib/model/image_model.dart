import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'username': username,
      'title': title,
      'slug': slug,
      'rating': rating,
      'importDateTime': importDateTime,
      'height': height,
      'width': width,
      'size': size,
    };
  }

  factory ImageModel.fromMap(Map<dynamic, dynamic> map) {
    return ImageModel(
      id: map['id'],
      url: map['url'],
      username: map['username'],
      title: map['title'],
      slug: map['slug'],
      rating: map['rating'],
      importDateTime: map['importDateTime'],
      height: map['height'],
      width: map['width'],
      size: map['size'],
    );
  }
  factory ImageModel.fromJson(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'],
      url: map['url'],
      username: map['username'],
      title: map['title'],
      slug: map['slug'],
      rating: map['rating'],
      importDateTime: map['importDateTime'],
      height: map['height'],
      width: map['width'],
      size: map['size'],
    );
  }
  factory ImageModel.fromDynamic(dynamic map) {
    return ImageModel(
      id: map['id'],
      url: map['url'],
      username: map['username'],
      title: map['title'],
      slug: map['slug'],
      rating: map['rating'],
      importDateTime: map['importDateTime'],
      height: map['height'],
      width: map['width'],
      size: map['size'],
    );
  }
}
