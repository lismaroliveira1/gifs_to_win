import 'dart:collection';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart';

import '../model.dart';
import 'api_key.dart';

class ImageRepository {
  final Client client;
  ImageRepository({@required this.client});
  List<ImageModel> _gifList;
  Future<List<ImageModel>> getAll(
      {@required int limit, @required int offset}) async {
    try {
      String url = "$baseUrl$api_key&limit=$limit&rating=g&offset=$offset";
      final response = await client.get(Uri.parse(url));
      return mapToGifList(response: jsonDecode(response.body));
    } on HttpError {
      throw HttpError.unexpected;
    }
  }

  Future<List<ImageModel>> getImagesByName(String username) async {
    try {
      String url =
          "$baseUrl$api_key&q=$username&limit=100&offset=0&rating=g&lang=en";
      final response = await client.get(Uri.parse(url));
      return mapToGifList(response: jsonDecode(response.body));
    } on HttpError {
      throw HttpError.unexpected;
    }
  }

  List<ImageModel> mapToGifList({@required Map response}) {
    _gifList = [];
    if (response == null || !response.containsKey('data'))
      throw HttpError.invalidData;
    List<dynamic> gifsMap = response['data'];
    for (LinkedHashMap gif in gifsMap) {
      _gifList.add(ImageModel(
        id: gif['id'],
        url: gif['images']['original']['webp'],
        title: gif['title'],
        slug: gif['slug'],
        username: gif['username'],
        rating: gif['rating'],
        importDateTime: gif['import_datetime'],
        width: gif['images']['original']['width'],
        height: gif['images']['original']['height'],
        size: gif['images']['original']['size'],
      ));
    }
    return _gifList;
  }
}
