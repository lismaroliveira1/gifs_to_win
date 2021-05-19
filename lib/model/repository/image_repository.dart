import 'dart:collection';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart';

import '../model.dart';
import 'api_key.dart';

class ImageRepository {
  final Client client;
  final Cache cache;
  final String baseUrl;
  ImageRepository({
    @required this.client,
    @required this.cache,
    @required this.baseUrl,
  });

  Future<List<ImageModel>> getAll({
    @required int limit,
    @required int offset,
    @required int imageQuality,
  }) async {
    String url = "$baseUrl$api_key&limit=$limit&rating=g&offset=$offset";
    final response = await client.get(
      Uri.parse(url),
    );
    verifyResponse(response);
    return mapToGifList(
      response: jsonDecode(response.body),
      imageQuality: imageQuality,
    );
  }

  void verifyResponse(Response response) {
    if (response.statusCode == 400 || response.statusCode == 404)
      throw HttpError.unexpected;
    if (response.statusCode == 500) throw HttpError.serverError;
  }

  Future<List<ImageModel>> getRandom(int imageQuality) async {
    String url = "$baseUrl$api_key&tag=&rating=g";
    final response = await client.get(Uri.parse(url));
    verifyResponse(response);
    return mapToGifList(
      response: jsonDecode(response.body),
      imageQuality: imageQuality,
    );
  }

  Future<List<ImageModel>> getImagesByName({
    @required String value,
    @required int imageQuality,
  }) async {
    String url = "$baseUrlSearch$api_key&q=$value&limit=50&lang=pt-br";
    final response = await client.get(Uri.parse(url));
    verifyResponse(response);
    return mapToGifList(
      response: jsonDecode(response.body),
      imageQuality: imageQuality,
    );
  }

  List<ImageModel> mapToGifList({
    @required Map response,
    @required int imageQuality,
  }) {
    List<ImageModel> _gifList = [];
    if (response == null || !response.containsKey('data'))
      throw HttpError.invalidData;
    List<dynamic> gifsMap = response['data'];
    final imageQualityString = changeImageQuality(imageQuality);
    for (LinkedHashMap gif in gifsMap) {
      _gifList.add(
        ImageModel(
            id: gif['id'],
            url: gif['images'][imageQualityString]['url'],
            title: gif['title'],
            slug: gif['slug'],
            username: gif['username'],
            rating: gif['rating'],
            importDateTime: gif['import_datetime'],
            width: gif['images']['original']['width'],
            height: gif['images']['original']['height'],
            size: gif['images']['original']['size'],
            hash: gif['images']['original']['hash']),
      );
    }
    return _gifList;
  }

  void initRepositorySetup() async {
    await cache.readData('setup');
  }

  String changeImageQuality(int value) {
    String imageQuality;
    switch (value) {
      case 1:
        imageQuality = '480w_still';
        break;
      case 2:
        imageQuality = 'original';
        break;
      case 3:
        imageQuality = 'fixed_height_still';
        break;
      case 4:
        imageQuality = 'fixed_width';
        break;
      case 5:
        imageQuality = 'fixed_height_small';
        break;
      case 6:
        imageQuality = 'fixed_width_small';
        break;
    }
    return imageQuality;
  }
}
