import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../lib/model/model.dart';
import './valid_data.dart';

class ClientSpy extends Mock implements Client {}

class CacheSpy extends Mock implements Cache {}

void main() {
  Future<Response> validaData() async => Response(jsonEncode(validData), 200);
  ClientSpy client;
  CacheSpy cache;
  String url;
  ImageRepository sut;
  int limit, offset, imageQuality;
  setUp(() {
    client = ClientSpy();
    cache = CacheSpy();
    url = faker.internet.httpsUrl();
    sut = ImageRepository(
      client: client,
      cache: cache,
      baseUrl: url,
    );
    limit = faker.randomGenerator.integer(50, min: 1);
    offset = faker.randomGenerator.integer(5, min: 1);
    imageQuality = faker.randomGenerator.integer(7, min: 1);
  });
  test('Should returns a valid data if client returns 200 status code',
      () async {
    when(client.get(any)).thenAnswer((_) async => validaData());
    final response = await sut.getAll(
        limit: limit, offset: offset, imageQuality: imageQuality);
    expect(response.length, validData['data'].length);
  });
}
