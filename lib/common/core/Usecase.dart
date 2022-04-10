import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutterfronttest/common/error/ApiExceptionToFailure.dart';
import 'package:flutterfronttest/common/error/LogManager.dart';
import 'package:flutterfronttest/common/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Type> exec(Params params);

  Future<Either<Failure, Type>> call(Params params) async {
    try {
      var result = await exec(params);
      var jsonData = json.encode(result);
      return Right(result);
    } catch (e, stacktrace) {
      await LogManager.exception(
        e,
        stacktrace,
      );

      if (e is CacheFailure) {
        return Left(e);
      } else if (e is DioError) {
        return Left(ApiExceptionToFailure(e).mapFailure());
      }
      return Left(IgnoreFailure());
    }
  }
}

class NoParams {}
