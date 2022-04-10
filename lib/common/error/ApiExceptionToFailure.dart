import 'package:dio/dio.dart';
import 'package:flutterfronttest/common/Router/routes_captain.dart';
import 'package:flutterfronttest/common/error/failure.dart';
import 'package:sailor/sailor.dart';

class ApiExceptionToFailure {
  ApiExceptionToFailure(this.data);

  DioError data;

  Failure mapFailure() {
    switch (this.data.response.statusCode) {
      case 403:
        return DioFailureUncorrectCred(
            data.message, this.data.response.statusCode);
      case 401:
        return DioFailureUncorrectCred(
            data.message, this.data.response.statusCode);
    }

    RoutesCaptain.sailor.pop();
    return IgnoreFailure();
  }
}
