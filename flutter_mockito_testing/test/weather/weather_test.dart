import 'package:flutter_mockito_testing/weather/model/weather_model.dart';
import 'package:flutter_mockito_testing/weather/service/weather_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'weather_test.mocks.dart';

//class MockClient extends Mock implements http.Client {}

@GenerateMocks([http.Client])
void main() {
  group("fetch weather data", () {
    late IWeatherService _weatherService;
    setUp(() {
      _weatherService = WeatherService();
    });

    test("succeed in fetching data", () async {
      final _url = 'https://jsonplaceholder.typicode.com/posts/1';

      final _client = MockClient();

      when(_client.get(Uri.parse(_url))).thenAnswer((_) async => http.Response(
          '{"userId":1,"id":10,"title":"Ankara","body":"Capital City"}', 200));

      final _data = await _weatherService.fetchWeather(_client);

      expect(_data, isA<Weather>());
    });

    test("succeed in fetching id", () async {
      final _url = 'https://jsonplaceholder.typicode.com/posts/1';

      final _client = MockClient();

      when(_client.get(Uri.parse(_url))).thenAnswer((_) async => http.Response(
          '{"userId":1,"id":10,"title":"Ankara","body":"Capital City"}', 200));

      final _data = await _weatherService.fetchWeatherId(_client);

      expect(_data, 10);
    });

    test("Failed to fetching data", () {
      final _url = 'https://jsonplaceholder.typicode.com/posts/1';

      final _client = MockClient();

      when(_client.get(Uri.parse(_url)))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      final _data = _weatherService.fetchWeather(_client);

      expect(_data, throwsException);
    });
  });
}
