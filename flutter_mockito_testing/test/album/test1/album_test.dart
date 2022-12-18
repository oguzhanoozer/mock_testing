import 'package:flutter_mockito_testing/album/model/album.dart';
import 'package:flutter_mockito_testing/album/service/fetch_album.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("fetchAlbum", () {
    late AlbumService _albumService;
    setUp(() {
      _albumService = AlbumService();
    });

    final _url = 'https://jsonplaceholder.typicode.com/albums/1';

    test("Album fetching is OK", () async {
      final client = MockClient();

      when(client.get(Uri.parse(_url))).thenAnswer((_) async =>
          http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await _albumService.fetchAlbum(client), isA<Album>());
    });

    test("Album fetching is failed", () async {
      final client = MockClient();

      when(client.get(Uri.parse(_url)))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(_albumService.fetchAlbum(client), throwsException);
    });
  });
}
