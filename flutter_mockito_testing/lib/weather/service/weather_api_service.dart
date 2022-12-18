import 'dart:convert';

import 'package:flutter_mockito_testing/weather/model/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class IWeatherService {
  Future<Weather> fetchWeather(http.Client client);
}

class WeatherService extends IWeatherService {
  final _url = 'https://jsonplaceholder.typicode.com/posts/1';

  @override
  Future<Weather> fetchWeather(http.Client client) async {
    final response = await client.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load post");
    }
  }
}
