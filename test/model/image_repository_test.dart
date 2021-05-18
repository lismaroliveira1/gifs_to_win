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
  String url, name;
  ImageRepository sut;
  int limit, offset, imageQuality;

  PostExpectation mockRequest() => when(client.get(any));
  void mockValidData() {
    mockRequest().thenAnswer((_) async => validaData());
  }

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
    name = faker.person.name();
    offset = faker.randomGenerator.integer(5, min: 1);
    imageQuality = faker.randomGenerator.integer(7, min: 1);
    mockValidData();
  });
  group('tests for getAll method', () {
    test('Should returns a valid data if client returns 200 status code',
        () async {
      final response = await sut.getAll(
          limit: limit, offset: offset, imageQuality: imageQuality);
      expect(response.length, validData['data'].length);
    });
    test('Should throws UnexpectedError if client returns 400 status code',
        () async {
      mockRequest()
          .thenAnswer((_) async => Response(jsonEncode(validData), 400));
      final response =
          sut.getAll(limit: limit, offset: offset, imageQuality: imageQuality);
      expect(response, throwsA(HttpError.unexpected));
    });
    test('Should throws UnexpectedError if client returns 404 status code',
        () async {
      mockRequest()
          .thenAnswer((_) async => Response(jsonEncode(validData), 404));
      final response =
          sut.getAll(limit: limit, offset: offset, imageQuality: imageQuality);
      expect(response, throwsA(HttpError.unexpected));
    });
    test('Should throws ServerError if client returns 500 status code',
        () async {
      mockRequest()
          .thenAnswer((_) async => Response(jsonEncode(validData), 500));
      final response =
          sut.getAll(limit: limit, offset: offset, imageQuality: imageQuality);
      expect(response, throwsA(HttpError.serverError));
    });
  });
  group('tests for getRandom method', () {
    test('Should returns a valid data if client returns 200 status code',
        () async {
      final response = await sut.getRandom(imageQuality);
      expect(response.length, validData['data'].length);
    });
    test('Should throws UnexpectedError if client returns 400 status code',
        () async {
      mockRequest()
          .thenAnswer((_) async => Response(jsonEncode(validData), 400));
      final response = sut.getRandom(imageQuality);
      expect(response, throwsA(HttpError.unexpected));
    });
    test('Should throws UnexpectedError if client returns 404 status code',
        () async {
      mockRequest()
          .thenAnswer((_) async => Response(jsonEncode(validData), 404));
      final response = sut.getRandom(imageQuality);
      expect(response, throwsA(HttpError.unexpected));
    });
    test('Should throws ServerError if client returns 500 status code',
        () async {
      mockRequest()
          .thenAnswer((_) async => Response(jsonEncode(validData), 500));
      final response = sut.getRandom(imageQuality);
      expect(response, throwsA(HttpError.serverError));
    });
  });
  group('tests for getImagesByName method', () {
    test('Should returns a valid data if client returns 200 status code',
        () async {
      final response =
          await sut.getImagesByName(value: name, imageQuality: imageQuality);
      expect(response.length, validData['data'].length);
    });
    test('Should throws UnexpectedError if client returns 400 status code',
        () async {
      mockRequest()
          .thenAnswer((_) async => Response(jsonEncode(validData), 400));
      final response =
          sut.getImagesByName(value: name, imageQuality: imageQuality);
      expect(response, throwsA(HttpError.unexpected));
    });
    test('Should throws UnexpectedError if client returns 404 status code',
        () async {
      mockRequest()
          .thenAnswer((_) async => Response(jsonEncode(validData), 404));
      final response =
          sut.getImagesByName(value: name, imageQuality: imageQuality);
      expect(response, throwsA(HttpError.unexpected));
    });
  });
}
