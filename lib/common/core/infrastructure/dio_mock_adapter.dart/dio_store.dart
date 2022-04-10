import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'idio_store.dart';

class DioMockAdapter implements IDioMockAdapter {
  @override
  void onGet(
    String url,
    Dio dio,
    dynamic data,
    dynamic message,
    int statutcode,
  ) {
    final dioAdapter = DioAdapter(dio: dio);

    return dioAdapter.onGet(
        url, (server) => server.reply(statutcode, {message}),
        data: data);
  }

  @override
  void onPost(
      String url, Dio dio, dynamic data, dynamic message, int statutcode) {
    final dioAdapter = DioAdapter(dio: dio);
    return dioAdapter.onPost(url, (server) => server.reply(statutcode, message),
        data: data);
  }
}
