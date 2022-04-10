import 'package:dio/dio.dart';

abstract class IDioMockAdapter {
  void onGet(
    String url,
    Dio dio,
    dynamic data,
    dynamic message,
    int statutcode,
  );
  void onPost(
    String url,
    Dio dio,
    dynamic data,
    dynamic message,
    int statutcode,
  );
}
