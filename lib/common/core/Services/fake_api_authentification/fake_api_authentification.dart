import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutterfronttest/common/core/ConfiReader.dart';
import 'package:flutterfronttest/common/core/GlobalStatic.dart';
import 'package:flutterfronttest/common/core/infrastructure/dio_mock_adapter.dart/dio_store.dart';
import 'package:flutterfronttest/common/core/infrastructure/dio_mock_adapter.dart/idio_store.dart';
import 'package:flutterfronttest/common/error/failure.dart';
import 'package:flutterfronttest/common/models/user_authentification.dart';
import 'package:flutterfronttest/common/models/user_information.dart';

Future<UserInformation> fakeApiAuthentification(
    UserAuthentification userAuthentification) async {
  const baseUrl = 'https://fakse_auth.com';
  IDioMockAdapter dioMockAdapter = DioMockAdapter();
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

  final usercredential = UserAuthentification.fromJson(
      await ConfigReader.initialize(GlobalStatic.AUTHENTIFICATION_CONFIG_FILE));
  if (usercredential.passWord == userAuthentification.passWord &&
      usercredential.passWord == userAuthentification.passWord) {
    final userInfo = UserInformation.fromJson(await ConfigReader.initialize(
        GlobalStatic.USER_INFORMATIONS_CONFIG_FILE));
    dioMockAdapter.onPost(baseUrl, dio, userAuthentification, userInfo, 200);
    dio.post(baseUrl, data: userAuthentification);
  } else {
    dioMockAdapter.onPost(baseUrl, dio, userAuthentification,
        "your username or password is incorrect", 403);
    dio.post(baseUrl, data: userAuthentification);
  }

  final response = await dio.post(baseUrl, data: userAuthentification);
  return UserInformation.fromJson(response.data);
}
