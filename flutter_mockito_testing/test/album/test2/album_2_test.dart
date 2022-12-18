import 'package:flutter_mockito_testing/album/model/album.dart';
import 'package:flutter_mockito_testing/album/service/fetch_album.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'album_2_test.mocks.dart';

class AlbumTest extends Mock implements IAlbum2Service {}

@GenerateMocks([AlbumTest])
void main() {
  group("fetchAlbum", () {
    final _model = Album();

    late IAlbum2Service _albumService;
    late MockAlbumTest _albumTest;

    setUp(() {
      _albumTest = MockAlbumTest();
      _albumService = Album2Service();
    });

    test("Album fetching is OK", () async {
      when(_albumTest.fetchAlbum()).thenAnswer((_) async => _model);
      final res = await _albumTest.fetchAlbum();

      expect(res, isA<Album>());
      expect(res, _model);
    });

    test("Album fetching is failed", () async {
      when(_albumTest.fetchAlbum()).thenAnswer((_) async => throw Exception());
      final res = _albumTest.fetchAlbum();

      expect(res, throwsException);
    });
  });
}
