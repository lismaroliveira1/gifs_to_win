import 'dart:collection';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart';

import '../model.dart';

class ImageRepository {
  final Client client;
  ImageRepository({@required this.client});
  List<ImageModel> _gifList;
  Future<List<ImageModel>> getAll({@required int limit}) async {
    try {
      String url =
          "https://api.giphy.com/v1/gifs/trending?api_key=xfo6ZXIbu3zAwbUm6BjO2MrIGzolUZKi&limit=$limit&rating=g";
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
        url: gif['images']['fixed_height_small']['url'],
        title: gif['title'],
      ));
    }
    return _gifList;
  }
}
