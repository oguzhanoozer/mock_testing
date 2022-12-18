import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  late Dio _dio = Dio();

  ApiService({Dio? dio}) {
    _dio = dio ?? Dio();
    _dio.options.baseUrl = _baseUrl;
  }

  Future<dynamic> get(String path) async {
    var responsejson;

    try {
      final response = await _dio.get(path);
      if (response.statusCode == HttpStatus.ok) {
        responsejson = response.data;
      }
    } catch (error) {
      throw "Data fetching was failed.";
    }
    return responsejson;
  }

  Future<dynamic> post(String path, dynamic data) async {
    var responsejson;

    try {
      final response = await _dio.post(path,
          data: data,
          options: Options()..headers = {'Content-Type': 'applications/json'});
      if (response.statusCode == HttpStatus.ok) {
        responsejson = response.data;
      }
    } catch (error) {
      throw "Data fetching was failed.";
    }
    return responsejson;
  }
}

class AuthRepository {
  Dio dio = Dio();

  AuthRepository();

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await dio.post(
        'https://reqres.in/api/login',
        data: {'email': email, 'password': password},
      );

      if (result.statusCode != 200) {
        return false;
      }
    } on DioError catch (e) {
      print(e.message);
      return false;
    }

    return true;
  }

  // ...
}
