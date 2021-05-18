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

  test('Should returns a valid data if client returns 200 status code',
      () async {
    final client = ClientSpy();
    final cache = CacheSpy();
    final url = faker.internet.httpsUrl();
    final sut = ImageRepository(
      client: client,
      cache: cache,
      baseUrl: url,
    );
    final limit = faker.randomGenerator.integer(50, min: 1);
    final offset = faker.randomGenerator.integer(5, min: 1);
    final imageQuality = faker.randomGenerator.integer(7, min: 1);
    when(client.get(any)).thenAnswer((_) async => validaData());
    final response = await sut.getAll(
        limit: limit, offset: offset, imageQuality: imageQuality);
    expect(response.length, validData['data'].length);
  });
}
