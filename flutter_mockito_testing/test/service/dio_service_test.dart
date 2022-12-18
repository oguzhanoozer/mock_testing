import 'package:dio/dio.dart';
import 'package:flutter_mockito_testing/core/service/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  final dio = Dio(BaseOptions());
  final dioAdapter = DioAdapter(dio: dio);

  const path = 'https://example.com';

  test('Successfully logged in user', () async {
    dioAdapter.onGet(
      path,
      (server) => server.reply(
        200,
        {'message': 'Success!'},
        // Reply would wait for one-sec before returning data.
        delay: const Duration(seconds: 1),
      ),
    );

    final response = await dio.get(path);

    print(response.data);
  });
}
