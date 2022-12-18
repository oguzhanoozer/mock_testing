import 'dart:convert';
import 'dart:io';

import '../model/album.dart';
import 'package:http/http.dart' as http;

abstract class IAlbumService {
  Future<Album> fetchAlbum(http.Client client);
}

class AlbumService extends IAlbumService {
  @override
  Future<Album> fetchAlbum(http.Client client) async {
    final _url = 'https://jsonplaceholder.typicode.com/albums/1';

    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == HttpStatus.ok) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch Data");
    }
  }
}

abstract class IAlbum2Service {
  Future<Album> fetchAlbum();
}

class Album2Service extends IAlbum2Service {
  @override
  Future<Album> fetchAlbum() async {
    final _url = 'https://jsonplaceholder.typicode.com/albums/1';

    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == HttpStatus.ok) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch Data");
    }
  }
}
